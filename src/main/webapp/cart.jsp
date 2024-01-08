<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.greensuper.market.namojsp.Cart" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    List<String> cartItems = (cart != null) ? cart.getItems() : new ArrayList<>();

    // Initialize variables
    boolean item1stat = false;
    boolean item2stat = false;
    boolean item3stat = false;
    boolean item4stat = false;

    // Check if each item is present in the cart
    for (String itemId : cartItems) {
        if ("item1".equals(itemId)) {
            item1stat = true;
        }
        if ("item2".equals(itemId)) {
            item2stat = true;
        }
        if ("item3".equals(itemId)) {
            item3stat = true;
        }
        if ("item4".equals(itemId)) {
            item4stat = true;
        }
    }

    boolean noItems = !item1stat && !item2stat && !item3stat && !item4stat;
%>

<%--<ul>--%>
<%--    <% for (String item : cartItems) { %>--%>
<%--    <li>--%>
<%--        <%= item %>--%>
<%--        <form action="RemoveFromCartServlet" method="post" style="display: inline;">--%>
<%--            <input type="hidden" name="itemId" value="<%= item %>">--%>
<%--            <button type="submit">Remove</button>--%>
<%--        </form>--%>
<%--    </li>--%>
<%--    <% } %>--%>
<%--</ul>--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>GREEN Super Market</title>
</head>
<body>
<header class="bg-white">
    <div class="mx-auto flex h-16 max-w-screen-xl items-center gap-8 px-4 sm:px-6 lg:px-8">
        <a class="block text-teal-600 text-xl font-bold mr-8" href="index.jsp">
            GREEN Super Market
        </a>

        <div class="flex flex-1 items-center justify-end md:justify-between">
            <nav aria-label="Global" class="hidden md:block">
                <ul class="flex items-center gap-6 text-sm">
                    <li>
                        <a class="text-gray-500 transition hover:text-gray-500/75" href="about"> About Us </a>
                    </li>
                    <li>
                        <a class="text-gray-500 transition hover:text-gray-500/75" href="about"> Contact Us </a>
                    </li>
                </ul>
            </nav>

            <div class="flex items-center gap-4">
                <div class="sm:flex sm:gap-4">
                    <a
                            class="block rounded-md bg-teal-600 px-5 py-2.5 text-sm font-medium text-white transition hover:bg-teal-700"
                            href="cart"
                    >
                        View Cart
                    </a>
                </div>

                <button
                        class="block rounded bg-gray-100 p-2.5 text-gray-600 transition hover:text-gray-600/75 md:hidden"
                >
                    <span class="sr-only">Toggle menu</span>
                    <svg
                            xmlns="http://www.w3.org/2000/svg"
                            class="h-5 w-5"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke="currentColor"
                            stroke-width="2"
                    >
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                </button>
            </div>
        </div>
    </div>
</header>

<!--
  Heads up! 👋

  Plugins:
    - @tailwindcss/forms
-->

<section>
    <div class="mx-auto max-w-screen-xl px-4 py-8 sm:px-6 sm:py-12 lg:px-8">
        <div class="mx-auto max-w-3xl">
            <header class="text-center">
                <h1 class="text-xl font-bold text-gray-900 sm:text-3xl">Your Cart</h1>
            </header>

            <div class="mt-8">
                <ul class="space-y-4">
                    <% if (noItems) { %>
                    <div class="w-full text-center">
                        No Items Available
                    </div>
                    <% } %>
                    <% if (item1stat) { %>
                    <li class="flex items-center gap-4">
                        <img
                                src="https://unsplash.com/photos/4_jhDO54BYg/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8MTB8fHZlZ2V0YWJsZXxlbnwwfHx8fDE3MDQ3MTM0OTl8MA&force=true&w=640"
                                alt=""
                                class="h-16 w-16 rounded object-cover"
                        />

                        <div>
                            <h3 class="text-sm text-gray-900">Vegetable Collection 01</h3>

                            <dl class="mt-0.5 space-y-px text-[10px] text-gray-600">
                                <div>
                                    <dt class="inline">For:</dt>
                                    <dd class="inline">2 People</dd>
                                </div>

                                <div>
                                    <dt class="inline">Last:</dt>
                                    <dd class="inline">7 Days</dd>
                                </div>
                            </dl>
                        </div>

                        <div class="flex flex-1 items-center justify-end gap-2">
                            <form>
                                <label for="Line1Qty" class="sr-only"> Quantity </label>

                                <input
                                        type="number"
                                        min="1"
                                        value="1"
                                        id="Line1Qty"
                                        class="h-8 w-12 rounded border-gray-200 bg-gray-50 p-0 text-center text-xs text-gray-600 [-moz-appearance:_textfield] focus:outline-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none"
                                />
                            </form>

                            <form  action="RemoveFromCartServlet" method="post" style="display: inline;">
                                <input type="hidden" name="itemId" value="item1">
                                <button type="submit" class="text-gray-600 transition hover:text-red-600">
                                    <span class="sr-only">Remove item</span>

                                    <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke-width="1.5"
                                            stroke="currentColor"
                                            class="h-4 w-4"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
                                        />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </li>
                    <% } %>
                    <% if (item2stat) { %>
                    <li class="flex items-center gap-4">
                        <img
                                src="https://unsplash.com/photos/zeFy-oCUhV8/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mnx8ZnJ1aXRzfGVufDB8fHx8MTcwNDcxMzk1Mnww&force=true&w=640"
                                alt=""
                                class="h-16 w-16 rounded object-cover"
                        />

                        <div>
                            <h3 class="text-sm text-gray-900">Fruit Collection 01</h3>

                            <dl class="mt-0.5 space-y-px text-[10px] text-gray-600">
                                <div>
                                    <dt class="inline">For:</dt>
                                    <dd class="inline">2 People</dd>
                                </div>

                                <div>
                                    <dt class="inline">Last:</dt>
                                    <dd class="inline">7 Days</dd>
                                </div>
                            </dl>
                        </div>

                        <div class="flex flex-1 items-center justify-end gap-2">
                            <form>
                                <label for="Line1Qty" class="sr-only"> Quantity </label>

                                <input
                                        type="number"
                                        min="1"
                                        value="1"
                                        id="Line2Qty"
                                        class="h-8 w-12 rounded border-gray-200 bg-gray-50 p-0 text-center text-xs text-gray-600 [-moz-appearance:_textfield] focus:outline-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none"
                                />
                            </form>

                            <form  action="RemoveFromCartServlet" method="post" style="display: inline;">
                                <input type="hidden" name="itemId" value="item2">
                                <button type="submit" class="text-gray-600 transition hover:text-red-600">
                                    <span class="sr-only">Remove item</span>

                                    <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke-width="1.5"
                                            stroke="currentColor"
                                            class="h-4 w-4"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
                                        />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </li>
                    <% } %>
                    <% if (item3stat) { %>
                    <li class="flex items-center gap-4">
                        <img
                                src="https://unsplash.com/photos/ZN-TT10kf4o/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8Mnx8cmljZSUyMGFuZCUyMGN1cnJ5fGVufDB8fHx8MTcwNDcxNDAyMHww&force=true&w=640"
                                alt=""
                                class="h-16 w-16 rounded object-cover"
                        />

                        <div>
                            <h3 class="text-sm text-gray-900">Rice and Curry Collection 01</h3>

                            <dl class="mt-0.5 space-y-px text-[10px] text-gray-600">
                                <div>
                                    <dt class="inline">For:</dt>
                                    <dd class="inline">2 People</dd>
                                </div>

                                <div>
                                    <dt class="inline">Last:</dt>
                                    <dd class="inline">7 Days</dd>
                                </div>
                            </dl>
                        </div>

                        <div class="flex flex-1 items-center justify-end gap-2">
                            <form>
                                <label for="Line1Qty" class="sr-only"> Quantity </label>

                                <input
                                        type="number"
                                        min="1"
                                        value="1"
                                        id="Line3Qty"
                                        class="h-8 w-12 rounded border-gray-200 bg-gray-50 p-0 text-center text-xs text-gray-600 [-moz-appearance:_textfield] focus:outline-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none"
                                />
                            </form>

                            <form  action="RemoveFromCartServlet" method="post" style="display: inline;">
                                <input type="hidden" name="itemId" value="item3">
                                <button type="submit" class="text-gray-600 transition hover:text-red-600">
                                    <span class="sr-only">Remove item</span>

                                    <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke-width="1.5"
                                            stroke="currentColor"
                                            class="h-4 w-4"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
                                        />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </li>
                    <% } %>
                    <% if (item4stat) { %>
                    <li class="flex items-center gap-4">
                        <img
                                src="https://unsplash.com/photos/AQ_BdsvLgqA/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NHx8bWVhdHN8ZW58MHx8fHwxNzA0NzE0MDg1fDA&force=true&w=640"
                                alt=""
                                class="h-16 w-16 rounded object-cover"
                        />

                        <div>
                            <h3 class="text-sm text-gray-900">Meats and Herbs Collection 01</h3>

                            <dl class="mt-0.5 space-y-px text-[10px] text-gray-600">
                                <div>
                                    <dt class="inline">For:</dt>
                                    <dd class="inline">2 People</dd>
                                </div>

                                <div>
                                    <dt class="inline">Last:</dt>
                                    <dd class="inline">3 Days</dd>
                                </div>
                            </dl>
                        </div>

                        <div class="flex flex-1 items-center justify-end gap-2">
                            <form>
                                <label for="Line1Qty" class="sr-only"> Quantity </label>

                                <input
                                        type="number"
                                        min="1"
                                        value="1"
                                        id="Line4Qty"
                                        class="h-8 w-12 rounded border-gray-200 bg-gray-50 p-0 text-center text-xs text-gray-600 [-moz-appearance:_textfield] focus:outline-none [&::-webkit-inner-spin-button]:m-0 [&::-webkit-inner-spin-button]:appearance-none [&::-webkit-outer-spin-button]:m-0 [&::-webkit-outer-spin-button]:appearance-none"
                                />
                            </form>

                            <form  action="RemoveFromCartServlet" method="post" style="display: inline;">
                                <input type="hidden" name="itemId" value="item4">
                                <button type="submit" class="text-gray-600 transition hover:text-red-600">
                                    <span class="sr-only">Remove item</span>

                                    <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            fill="none"
                                            viewBox="0 0 24 24"
                                            stroke-width="1.5"
                                            stroke="currentColor"
                                            class="h-4 w-4"
                                    >
                                        <path
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
                                        />
                                    </svg>
                                </button>
                            </form>
                        </div>
                    </li>
                    <% } %>
                </ul>

                <div class="mt-8 flex justify-end border-t border-gray-100 pt-8">
                    <div class="w-screen max-w-lg space-y-4">
                        <dl class="space-y-0.5 text-sm text-gray-700">
                            <div class="flex justify-between">
                                <dt>Subtotal</dt>
                                <dd id="tot">£250</dd>
                            </div>

                            <div class="flex justify-between">
                                <dt>VAT</dt>
                                <dd id="vat">$0</dd>
                            </div>

                            <div class="flex justify-between">
                                <dt>Discount</dt>
                                <dd id="dis">$0</dd>
                            </div>

                            <div class="flex justify-between !text-base font-medium">
                                <dt>Total</dt>
                                <dd id="sub">£200</dd>
                            </div>
                        </dl>

                        <div class="flex justify-end">
              <span
                      class="inline-flex items-center justify-center rounded-full bg-indigo-100 px-2.5 py-0.5 text-indigo-700"
              >
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke-width="1.5"
                        stroke="currentColor"
                        class="-ms-1 me-1.5 h-4 w-4"
                >
                  <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M16.5 6v.75m0 3v.75m0 3v.75m0 3V18m-9-5.25h5.25M7.5 15h3M3.375 5.25c-.621 0-1.125.504-1.125 1.125v3.026a2.999 2.999 0 010 5.198v3.026c0 .621.504 1.125 1.125 1.125h17.25c.621 0 1.125-.504 1.125-1.125v-3.026a2.999 2.999 0 010-5.198V6.375c0-.621-.504-1.125-1.125-1.125H3.375z"
                  />
                </svg>

                <p class="whitespace-nowrap text-xs">2 Discounts Applied</p>
              </span>
                        </div>

                        <div class="flex flex-col gap-4">
                            <input type="email" placeholder="Enter Email to Receive Receipt" id="mail" class="w-full p-4 border-gray-600 rounded-md" placeholder="Email Address" />

                            <div id="paypal-button-container" class="max-w-32"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<footer class="bg-gray-100">
    <div class="mx-auto max-w-5xl px-4 py-16 sm:px-6 lg:px-8">
        <div class="flex justify-center text-teal-600">
            <h2 class="text-teal-600 text-2xl font-bold">GREEN Super Market</h2>
        </div>

        <p class="mx-auto mt-6 max-w-md text-center leading-relaxed text-gray-500">
            Envision a marketplace where every product is thoughtfully curated to minimize environmental impact. Our motto, "Stay Green. Shop Green," echoes through the virtual aisles, encouraging you to make choices that align with your values and contribute to a healthier planet.
        </p>

        <ul class="mt-12 flex flex-wrap justify-center gap-6 md:gap-8 lg:gap-12">
            <li>
                <a class="text-gray-700 transition hover:text-gray-700/75" href="about"> About Us</a>
            </li>
        </ul>

        <ul class="mt-12 flex justify-center gap-6 md:gap-8">
            <li>
                <a
                        href=""
                        rel="noreferrer"
                        target="_blank"
                        class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">Facebook</span>
                    <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path
                                fill-rule="evenodd"
                                d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                                clip-rule="evenodd"
                        />
                    </svg>
                </a>
            </li>

            <li>
                <a
                        href=""
                        rel="noreferrer"
                        target="_blank"
                        class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">Instagram</span>
                    <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path
                                fill-rule="evenodd"
                                d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                                clip-rule="evenodd"
                        />
                    </svg>
                </a>
            </li>

            <li>
                <a
                        href=""
                        rel="noreferrer"
                        target="_blank"
                        class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">Twitter</span>
                    <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path
                                d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"
                        />
                    </svg>
                </a>
            </li>

            <li>
                <a
                        href=""
                        rel="noreferrer"
                        target="_blank"
                        class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">GitHub</span>
                    <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path
                                fill-rule="evenodd"
                                d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                                clip-rule="evenodd"
                        />
                    </svg>
                </a>
            </li>

            <li>
                <a
                        href=""
                        rel="noreferrer"
                        target="_blank"
                        class="text-gray-700 transition hover:text-gray-700/75"
                >
                    <span class="sr-only">Dribbble</span>
                    <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                        <path
                                fill-rule="evenodd"
                                d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c5.51 0 10-4.48 10-10S17.51 2 12 2zm6.605 4.61a8.502 8.502 0 011.93 5.314c-.281-.054-3.101-.629-5.943-.271-.065-.141-.12-.293-.184-.445a25.416 25.416 0 00-.564-1.236c3.145-1.28 4.577-3.124 4.761-3.362zM12 3.475c2.17 0 4.154.813 5.662 2.148-.152.216-1.443 1.941-4.48 3.08-1.399-2.57-2.95-4.675-3.189-5A8.687 8.687 0 0112 3.475zm-3.633.803a53.896 53.896 0 013.167 4.935c-3.992 1.063-7.517 1.04-7.896 1.04a8.581 8.581 0 014.729-5.975zM3.453 12.01v-.26c.37.01 4.512.065 8.775-1.215.25.477.477.965.694 1.453-.109.033-.228.065-.336.098-4.404 1.42-6.747 5.303-6.942 5.629a8.522 8.522 0 01-2.19-5.705zM12 20.547a8.482 8.482 0 01-5.239-1.8c.152-.315 1.888-3.656 6.703-5.337.022-.01.033-.01.054-.022a35.318 35.318 0 011.823 6.475 8.4 8.4 0 01-3.341.684zm4.761-1.465c-.086-.52-.542-3.015-1.659-6.084 2.679-.423 5.022.271 5.314.369a8.468 8.468 0 01-3.655 5.715z"
                                clip-rule="evenodd"
                        />
                    </svg>
                </a>
            </li>
        </ul>
    </div>
</footer>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>

    function updatePrice(){
        let item1 = $("#Line1Qty").val() || 0;
        let item2 = $("#Line2Qty").val() || 0;
        let item3 = $("#Line3Qty").val() || 0;
        let item4 = $("#Line4Qty").val() || 0;

        let price = Number(item1) * 10 + Number(item2) * 8 + Number(item3) * 14 + Number(item4) * 10;

        $("#tot").text("$" + price);
        $("#vat").text("$" + (price * 0.2).toFixed(2));
        $("#dis").text("$" + (price * 0.1).toFixed(2));
        $("#sub").text("$" + (price * 1.1).toFixed(2));

        return {
            price: price,
            vat: price * 0.2,
            dis: price * 0.1,
            sub: price * 1.1
        }
    }

    $(document).ready(function () {
        updatePrice();
        //  Add event listners and when values changes chage the variables
        $("#Line1Qty").on("change", function () {
            updatePrice();
        });
        $("#Line2Qty").on("change", function () {
            updatePrice();
        });
        $("#Line3Qty").on("change", function () {
            updatePrice();
        });
        $("#Line4Qty").on("change", function () {
            updatePrice();
        });
    });
</script>

<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
</script>
<script type="text/javascript">
    (function(){
        emailjs.init("7VsdBoTsRa7RvWE5t");
    })();
</script>

<script src="https://www.paypal.com/sdk/js?client-id=Aeiq6NDJnL7sl2xYN17SNyDXEAbpnF9miyb4e-qghUnEDzmEt0-bgc6u8PSwlOvSST6oKbXvTLl1MWvP&components=buttons"></script>
<script>
    paypal.Buttons({
        style: {
            disableMaxWidth: true
        },onApprove(data) {
            // This function captures the funds from the transaction.
            console.log(data);
            let email = $("#mail").val();
            // check if email is valid
            const validateEmail = (email) => {
                return String(email)
                    .toLowerCase()
                    .match(
                        /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                    );
            };

            if (validateEmail(email)) {
                var templateParams = {
                    to_email: email,
                    tot: $("#tot").text(),
                    vat: $("#vat").text(),
                    dis: $("#dis").text(),
                    sub: $("#sub").text()
                };

                emailjs.send('service_3xv2qvd', 'template_128fvng', templateParams)
                    .then(function(response) {
                        console.log('SUCCESS!', response.status, response.text);
                    }, function(error) {
                        console.log('FAILED...', error);
                    });

                console.log("Email: " + email);
            }
        }, createOrder: function(data, actions) {
            return actions.order.create({
                purchase_units: [{"description":"Green Super Market","amount":{"currency_code":"USD","value":$("#sub").text().substring(1)}}]
            });
        },

    }).render('#paypal-button-container');
</script>

</body>
</html>
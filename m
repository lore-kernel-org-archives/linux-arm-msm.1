Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E55C36D9EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790831; cv=none; b=RcmckPGFY1bGOdJwBC9Kr4+VwrQCVFvAePa9cSg7535hhgLmizKxts7OAVc6ZZMtnikdsvet/iL0HCMUH/DLHYdhcUhp6cLDhMnxWP72VKb3lnJ2JgMFHlkzkDBAIYdEhQSoIiHJDjvMZq2ITGyS+xZojVqQsTB+C7HtF8xPfSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790831; c=relaxed/simple;
	bh=TJJoflzFcFZ4cQXlQeaQN+SOZ1EUO7jBM0FzgQFtgZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLNkuSoQ6C69i4VRMPXaG3Ua41srkSy8VGmbtufyyddvt7J0c8PMdM81xTMFYgwSvdMDqP470+6SbeKbayE22fgDaIMgJbnMme8Hp8VAkTOZ34xWnTLwRsB0yAvHQM0T3PiJnVvSK70i3RmbRZVdvqVdJUNFl4BV00xs5VIq+kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbDt+0jt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kioMZBTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbDt+0jt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kioMZBTB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55qu3303001
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZXhT5AUPUcds7dQKh6lnrg0DqfZ52DTtRRleOpRZB0=; b=BbDt+0jts0UI35rE
	Ala+sra75Ls/AZ4Pg20JTC93V6b5ODjcU60EV1QNpikxGXxilBDsxo+hHy/LmACQ
	EFzmLzk1UWOXRb5uQev5zjVdMEv/g9FvKXma36DdZT201JxJcuUJAlwb8JcERF+p
	5H8GdctP5ksZr4VYrFvao+8QRX6daPPp+GD2nXxxwUQxKVK+QO/AqdXefxJPvILJ
	Bm01YQ00vc7hZJTvwlxibhGG5oBOl8wbZADt5I8DCb9zaUdN7l7sMxybh4WrpD8H
	HmUYip1S8/Gy5S9Gh4n1Mxvd8adJrf6kZPj9m+JFZvlepyF4E7M9xEvRFZbyFxvU
	TvPaXw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dhm4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:40:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350173dc7aso3618431cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791790828; x=1792395628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZXhT5AUPUcds7dQKh6lnrg0DqfZ52DTtRRleOpRZB0=;
        b=kioMZBTBp20AO1Wc6g7+s8XvaD0loJJ7xDcBcNq8P2M8LZKoo16nu+d/gqHnrIhIg+
         Kdzatjk2go6dPE3K9RgWGTAbH5Lo8rpp9pjGEtN0qExUjlnC6UWqlf3rMNwjRwdQrk7o
         CIq+tl7OgW+4yWT5Phr0lx8KPJ9toeJMn+hZOx9V3SWOzKtzIxxcO8jq1yDYweuDHC59
         ConSeMOG4t99+rWo8yID4W8ZXzZi5XqVpf+HO/rzotWAzjgisOfzVqWF2gGJh2MfSuXm
         BwYSlgsM9B30a+mdFwYIzqfYhcWZYqo+hT7n6U3iHAQ2jfSQGUcf0pXj5shZqaKPs8rJ
         9WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790828; x=1792395628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZXhT5AUPUcds7dQKh6lnrg0DqfZ52DTtRRleOpRZB0=;
        b=gtCCtDzNEuhzgZQZi2QWHDG/oWfkbBAGoY0r9J1oouqSCJ94UZieITvnVAqDThY7Fw
         Uvp/dJBgBLVw0wa3ttI4UWhRPcJzKVpID0eFbyJw1H/2LCtwl4pT9EZ8zpusmXyQwp+0
         zTPytzRhP4s6XxtqtL3XFDSJJZnVK/8lJ1w3xveeecTh71y2OAHwxoA39DPwj5dS7+xb
         dTt7PnIMz7vpd/JmD4O7ORZfJRJut3OcVKgOX8u1tSUN0WU0MEmMXySeOYaCopAshQPJ
         zUcalghtquIiIsAUYADG8dCYBrG2glswSZzMA4zbi76hvKwJbEGiKPXs5XXVhJdPi+8C
         RW5A==
X-Forwarded-Encrypted: i=1; AKwUvBxHun++eE69roKovr8eX2DVGRqcDYCR08fBLw0HHJbFcyYz60EU3yPWalNdEH8EapjUksOwMeOARgeh9aUs@vger.kernel.org
X-Gm-Message-State: AFq9FYLJiE+xJtwhPx/xoW1Jeizj4eHdeSqyZhjAq1l2m0N2UWlM+koe
	91LxeymwnC111cKZAPxmApjqxiysEDCYOC9G4PJSzs6r48p+Geoy/taiqCV0mcYhPQ7aIba0rzD
	jjxmRV+Kqzeq0SWdBbLcRKWlc06I4JQ6g/FiU9CSc2lvTNxHcwCAaO1faZvwKzJ7EbUul
X-Gm-Gg: AYBFou0jjfDBGZMUbWLdlKNQSg/PYTdNXY82FQ9tyOAceOMzC2Fy+pR1QAixvhWe23L
	eFCYvEFtTJVFLaX99dgzo+7YaMpSYlgA8pdIsQl7sZ7YPttj8nl0ILqzOeCvkH1cFR+NrOL60gA
	t9RX4dEIgYfoci21xGRdYiuTZHwJdwKfNMPPBVndY9jfSDyjN9ISZJGZviEc57nBORncUbX9Zan
	samGt/Nyg5geP1BvAXJnFgPuTq5gKf0BwOSv78OdZmNiDc7u82NkBg4RTOOlTXZg/Vo6zKsyL/x
	1XmNrcFkAMNEitRZDDoxwWNLdqGKOmpxfI40Gxbg3rQod3BLpTniQ/CyoeVt9eLzcMP7izeZRuy
	vQo3RCJkdhZgG5hMgyQ9/Hw==
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr117219301cf.1.1791790828452;
        Mon, 12 Oct 2026 00:40:28 -0700 (PDT)
X-Received: by 2002:a05:622a:e0cf:10b0:533:6948:3d2b with SMTP id d75a77b69052e-5359f4990d7mr117219061cf.1.1791790827961;
        Mon, 12 Oct 2026 00:40:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9accf47sm429403466b.76.2026.10.12.00.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:40:26 -0700 (PDT)
Message-ID: <2ca0fff3-aadc-4dcd-93e8-df2ffbac08ab@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 09:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and
 controller nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
 <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
 <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
 <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
 <asyANRr8ac_SD0CG@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <asyANRr8ac_SD0CG@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfXxtMEmCPIphlC
 dyp8MKC8eKLGGadaCYwb0kDF3T3R0z3Gz+ptE1HpqRpaWvx2wANe1HwZls7Iy5AGEKwkg+JLnpZ
 z9xg1WgikJxv+aVxcmdzuCIya5zbYWOWbjnY9U/MNxQpfw4nYqtL5AM+UVIalSU4+LObPBykp6A
 Y0PmLIwFkAJ3NyGLMLZU8AtCVIK2/Y+dpYYnX98gr/RZHoGUzdMW5dN7HTL+CLkrd6eOSPXwbRP
 wM9bcFWgOYQa1ZFc05HTBKjd3P6HcrA3Ot2kepCkriIIsAltAgL/k3r5BnpWz6TyKfb6TPL5y7E
 28xnhE9sl8sgtsHhRrcEjRUmSSe7YuWz6qi3UzVukEoBrp1ao7QONYmUZZQqGV9Nf5A4YiN8hao
 EXOMjscomx2+bWuB4GEAofiuzX/EQinfQJP/NHCied5M4IQjzkYYgJ0xIQ+i7ODO52kfYp9x1gC
 ibMiYiDegyztAeX7sPw==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6acc8eed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BjiBRVP3CVE4MUQrlPQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: VSj31Qmvma_BuEWTusizVILLcvN6YjU6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfXwbPRy/d8As8/
 8dabE2M0JZwBY4USwLmiPhIcEwgv1s1DaiL/agMAxdRkpU91bx3o5LmBSpPZyzO1nvT6F0xcDbq
 lQSGbvEeJ02caJc2ab1dvaPaFwYmg3A=
X-Proofpoint-ORIG-GUID: VSj31Qmvma_BuEWTusizVILLcvN6YjU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120030

On 10/12/26 8:37 AM, Shawn Guo wrote:
> On Mon, Oct 12, 2026 at 10:52:34AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 10/10/2026 8:04 AM, Shawn Guo wrote:
>>> On Tue, Sep 15, 2026 at 09:56:28AM +0800, Shawn Guo wrote:
>>>> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

[...]

>>>> +		perst-pins {
>>>> +			pins = "gpio2";
>>>> +			function = "gpio";
>>>> +			drive-strength = <2>;
>>>> +			bias-disable;
>>>> +		};
>>> pcie0_clk_req_n is a SoC level pin function, so it has a good reason to
>>> stay here. But wake and perst are board chosen GPIOs. I think they should
>>> go to board DTS.
>> Shawn, I don't see perst and wake gpios are changing per board, for that
>> reason I added them here, but such requirement is coming we can move them to
>> board file.
> 
> Well, we have only seen Ride and RRD so far. We never know how other Nord
> based boards to come will choose the perst and wake GPIOs. This is
> simply a board level configuration and should go to board dts.

They never do in practice (for a good reason, the reference-chosen pins are
consecutive and presumably next to each other) and we have no occurences of
that in the tree across the hundreds of devices.

Konrad

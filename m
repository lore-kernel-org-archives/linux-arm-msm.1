Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0917A3E9F93
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653411; cv=none; b=uXv7vq1m8ruOVcIjZlHu3pWetG3aAa+/8AcE6jdl/ux49HRb9kybk6tU1RGNidrU1IXG7NAANJEwCkQWFgMaPcWqFuLzp44db3hILJYhxKHeAxkV5FDiQi1mZx9JEiKwl5zzyu/3sRfgljx7kiJPRCKesFbkeoTe1/+7ESR/9+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653411; c=relaxed/simple;
	bh=AdiOWnHiPW65nM5YRiStJWIJJIZeis5wrnpPpaqE8jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYeWJgg/2jYQITZfH/TXDSpzRYfpEWzAuDx7oW74AW3NRa2zlvAAgftev/X1ME6XFMw1tFPDSc/+U3Xp8H0AiZ88LHf8G30gx5S2crxstKekLNJKrWPMIxHh7Jv9D5fYBaWKaZtCrUXS+iJf4xcCKNCtuG9DY3B/3lUOuEkDZkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nh3QrMk8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1eTQ1Db; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nh3QrMk8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1eTQ1Db"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88Pet196234
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4zjlQS0oANmuiX3HHB5X6Y6G6gRgLiEneTD2JpGa2A=; b=Nh3QrMk8RIPoCGj9
	nRZ6G+gwgtI1rBp1LECEuq4f3qnBYjzth1nQqiZpdS5UOz6i1zM15OheR/XCJp0k
	7tBL8dtWEZN6zuxagJZBElcfhIn0kkJRW7y+en1nHPk2+0E5ukvx57MN7u3o/iG/
	bFoe4kr0JRG+uWopnVvrj2IR37L2baz72cJ91uzzSDXHhWuJN9GHIVp1ixPeSZv5
	f6pItsYBVvHLpEV/2aFWQ8I8BqN14tz3AXtLdx8Pq0ln/LUC651f1Rq/MFTLn5hb
	2PsoocQICNz9ZOBRqdz7Sxt/lSvFMgCFi/nLEUNUPw9M29zAZ+swcH4mcsGD2cp8
	+rs04g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93pvhcth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:23:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c3cd150bc9so64266e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653408; x=1788258208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4zjlQS0oANmuiX3HHB5X6Y6G6gRgLiEneTD2JpGa2A=;
        b=e1eTQ1Dbfqr3w2G5N4yzBTmMiirmIzavnul7hU62Ijzh/JqhYWBvKzDp5Af76XKVV/
         K7sRGgidxGq8xrLbH86m0sH7dl2DJt/Hr4lzeUWEC23+CnF1cfntwE775dOgsZOtMFyD
         PCq8ECOE+LsfVM5DhxYz+W6e8t8VwvukT7KCrT65E97kdoWPgx5qU8BM24MuOOlnQlyh
         8AwB9xOVQ479jc8qgGkKFgvxe55SHIJYq95o7OcFTNsQkf3XshZJ4DQVZgKywMhMdRwd
         e2tZyqLkwYzCJdhWSKznAX1OqZnrHcIn1UbJu5gsO6N0ZYM9Gbk9yesDdGixJOD6ivXE
         12eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653408; x=1788258208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4zjlQS0oANmuiX3HHB5X6Y6G6gRgLiEneTD2JpGa2A=;
        b=ir/r9hlsBRSuBJjwK38zwcyMir9Xkse44f+XQajMgPRSiCw22zsAPg9HXPHxVbJH5h
         EFD9M3iyNT6IjtT6X1rh3Q+/lNyIsT4vNyMvcelV6u7nrV71htuxPerk+pSYwGWN0Kcd
         82JTkNObXAAGAYbmHKSqKzs7svmzcCLOp9GFbYiARtuNP2nwuXx4twtpLuaWCH3X1mtQ
         SNNEDK5Vp97ocRt1YGC5SSjm6uMD2fO7VXYp9mHRfm8fLxLH1f9ITxbgvMNzbkrnM4XY
         +9NJZkfYV91NlvVrpKtPZrRdon1mDd1ly11xYCu3JCihZgQgYqY5Hg4rJyxg2SDqP0eB
         Grww==
X-Forwarded-Encrypted: i=1; AHgh+RrL8xEgiKIGZd+XC3qs5QRPnF93KFJq6yFgeWI3XoX5DVK55gAbNeBFHDmrZGL4CfTgCXTgKrvyeplI6Hd+@vger.kernel.org
X-Gm-Message-State: AFuF++mdFlCPXqWgdxIr2PEcThhRwkh08o2culdsE9CJqHU1hwaYI2e5
	m3t+uu8lprnC4K7Q5DFm1K8gX64hGiQWxNJRo2rj/Yb3PPgMz82SGZZsGbF/osRif+iV25II4KC
	au/FFo5XVT3gI0hQ+CME5Ud54jMNy4HvVn164e71Ib+ZrbOyjEivYW6XUI3UyyhBAC24r
X-Gm-Gg: AR+sD10NeMkIyf/GVCztdkdKpFzHfxxyxFMu7M4E251z4ytSsmyyXt0j5KsP5vzgdiV
	YR8lRIPhdW5kMcRg6lnVHMl8fZIf0ZuLOydxkTygLB2AImKQnDH9WAWpm7kXzjpHZlKcTQpM6MQ
	XRHa6xuGj/4GBCYQLyI4+vy2QQImUsI+AQVwfxUnoOzL6cjDXqlqdVEE4KFzM+57RxUp2fX4PSg
	L8xoY0qDIizbMJPv34ohl9B+HFXEod6ABqY0kjasJN0Yb+dLtYP1VF+1AlXg2DA0RbXzrlkFO33
	DqmWRegGifyJaWOL6RocXhhU5i7TsDEpTIwXBQhjeRM+CZhL0NxvMSUfROaG9CZDhsa29YxiiFM
	BTCcBUOEKXpiyceaIykUph61C
X-Received: by 2002:a05:6122:1296:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c5ff69b867mr3688918e0c.1.1787653408092;
        Tue, 25 Aug 2026 03:23:28 -0700 (PDT)
X-Received: by 2002:a05:6122:1296:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c5ff69b867mr3688911e0c.1.1787653407657;
        Tue, 25 Aug 2026 03:23:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199ad5sm13071304a12.18.2026.08.25.03.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:23:26 -0700 (PDT)
Message-ID: <294ea94a-5749-4d44-8aa2-35c16fc60145@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:23:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Connect USB3 PHY pipe clock to
 GCC
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-dts-qcom-eliza-add-missing-usb-dp-phy-clk-to-gcc-v1-1-f0d3719f798c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX+RilTwu+jxXZ
 Ntpr+6s6CBrw9x6JGQdU+sxu/sI+IlvvF+2rKXx1c4CsGcnxEW+Mw+Fr0/HjGHWlKl4oApRJ9WP
 /m48GPS2bcYebZtd1MOUiYjnoE50olk=
X-Proofpoint-GUID: 5WUPuwiy12W89O6f4jWPWtKVaXfixnVT
X-Proofpoint-ORIG-GUID: 5WUPuwiy12W89O6f4jWPWtKVaXfixnVT
X-Authority-Analysis: v=2.4 cv=Ru716imK c=1 sm=1 tr=0 ts=6a8d6d20 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2CJPG24AF_AVZppijzwA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX/AnkK4NcJK3b
 BSNz2OlFZTjEPFbKR2u2rYc4gEASBh/W2OzLYHd/sNyEJVFLEq5jVExroUEFxSEfVBoHi9CATfR
 NBCH31dKfNbraklmkhhsqQprSdqSSaWrLt9GwQFUq32en34YCwOOt/QbK0KBgwm0gekGkJEZetc
 K8e5r6A7rae6OubXs+7pLnUq+WrX2aZ8OKP/7dkhYCyKF3N94xHIPjZ9X9hLnu8pkoUl6gwf5y9
 +7PQLwdaijiOx/S6+Ix4PZCFbTex7IoiPv1TRLdSt+D/MqAUWf3+9D6IPhU4KskA80uYJ2/a2Q9
 T8Yf+FFMWmytRBPfjc6vzGD9hkiS4DyWETrw0MknYo6voQdvsDrm+ykt6zMfb0KmjQr/q5uSU9D
 u77lMV886rg57J4hIVRjN3j7oCjF+nSYlCtn1h+LNn0LQs4IemlQt4UrmHdOv1QS0P3zPlRQMvF
 X/ANMtaIhuZ9RfVdTGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250087

On 8/25/26 11:58 AM, Abel Vesa wrote:
> The GCC USB3 primary PHY pipe clock is sourced by the USB3 pipe output of
> the USB/DP QMP PHY. The corresponding GCC clock input was left as an
> empty clock specifier when the USB nodes were added.
> 
> Connect the QMP PHY USB3 output to GCC so the USB3 PHY pipe clock can
> propagate to the USB controller.
> 
> Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

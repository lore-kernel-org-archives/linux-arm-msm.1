Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2505E5437CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093012; cv=none; b=fA4I+OnDs3atvQ2Vehzo1s1th5kqKuwPdfBROg43XWo80A9l8PunigYXJOUVgwmY5/bi8soGCMvMidEvBwc00kdfWfBpc1gQyBYfuMAT1mA2oehi72SQN604ppJPsTGutxwF7X+vpDM0FngC5wy66XzaS/8EWmCuAvjBTGAQJAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093012; c=relaxed/simple;
	bh=e8JQAB+2OKIHJqqLitjcvJVtojsIbIdvMsU0sAm5iQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iRuU3uxb+6PnYkfWImtNFTX0nOCZgee1uVa0R0uHOXNScnygkuK4Jd3RG7t99MPL8sEvLIwCpHdaPyqoBF0Az5tEBop5qBKF1VvtgjqFKSTJlnqBSGUhK7xhxyuGcLvSC3jRLooo/dN1jQ5OJjQDGsLrI8dEYvrmifK+795xNio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WI2m3eSO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M/IL+8mE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WI2m3eSO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M/IL+8mE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjW5F1058379
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SRf6BCtAUOHCG8nbF0m+RZ4k
	S7K7e6lPtCgKhANO0i0=; b=WI2m3eSOQYqv7AxA0n5TQyrAEjYn0kOEtyQjmMzp
	wkY3WIsGZCRsoA97xS5I32+Jjs4/QkRFwuwnDW6DCWWb8lMSBhYPe5X0X71BhnoL
	iXN7vXxGbC188YMDsviFHrqIbwY0CR+pmU5PW2T8Qw2SkxIdffjhvZaoQJTXJDQK
	2PbGh3EAJenGiQOWztTUmOhQbtc7WG61/Rc8WMA2Zg+VDGme2em1la+Vnj6sebVQ
	7t7DwTZ1JrQA7R3ZoMsuxBBvqG1qNN54YA/FhFzlOvpmd3JJMu7GSYI9ItgR8fT7
	mMGpGDf0VWquVr/sHO9CxENBiURnea93L66iRPoLIwvVKQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5u9dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:03:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bbd01d56ecso1199551e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093004; x=1790697804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SRf6BCtAUOHCG8nbF0m+RZ4kS7K7e6lPtCgKhANO0i0=;
        b=M/IL+8mEJUGXmnP74W4GjVHMF0f4dSqsNOreLb5oldNON0KAxg+XCgYbFv0G3znAKa
         Yv9e08CgOL92z2MF0a5qQbGojFQHqDFBgiTZeYGMzAIyCC49BEvXifBSXZieWc/x6nnU
         BhdM/IxN1njk4S+uZXsa+BYG84UT/cnsMwwvDVn0HjGK/VGrQrLYax3pG45F/8BgDYp4
         hhkLvkwYCGN8ZzTTj0lxgpeYLlBmxCZUoZHtmEUwXdjZvmF9SqTsag4rdrr7CQzdhvSU
         eywVvGPMK0TaxCZUiaa2Te9vWhigqmpRK338Igvy7KvqlhyN1QLYOQvS+ttBoaFWr+vC
         jg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093004; x=1790697804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRf6BCtAUOHCG8nbF0m+RZ4kS7K7e6lPtCgKhANO0i0=;
        b=CzpATupRvQfsMP/tb/6OmJ0nV9G2Oqhn+kfkKUygCRQYDTSQFZ9WcrWtxDDWzf6DJZ
         DYYKrV2/LsjTKoqVbZ+HbvnGuwnFs+oFERxpnc34VEl/hm9Ywo2SxyNdtGoU6+2bwWz3
         /+oqOJgF22OOSXBcCU7tZPdlwPMwszBEh8jyWhh+dgOUNQ+cYGvwYFzoy6nhe1zRcqeu
         bfQA7ghVIDyYyLW8SpoV/XyWQsBbbQ/gtopfo+3OCNilW9+iwbZCR+/cYdudadvRPX3s
         i1qbA46bDLExVWK7r2BsR2/EGXUGKhOvsTNE+H2qrl8Tmj3bCEf8+7WiDzoaeZ3bqJKO
         BWHA==
X-Forwarded-Encrypted: i=1; AKwUvBygklig3SXknwfpikl5ZkqP7VKTV0lYKVzeT0PiATC/FRzzQ1YwST2BFPU/GWm9KMNSuMors9o3fh7fexD4@vger.kernel.org
X-Gm-Message-State: AFuF++nEv4MO9SsW+t4jxi8Adw3Cfet0q2QIK1TD1xB55RkrKTrGDQ3i
	f2q33rWDtByM89l/55E692SU9AFkmxas92UntLKJ2Z/MO8d1EzKk8dsD0pnAp5szrfj+OnYDLu8
	XXC8uqAS7qsnEU6lXuH/ffBHrC07R4tL7YCOhNdEqXdFL8n2TLzP/pIR9QlK8Rmsh5YEr
X-Gm-Gg: AYBFou3qmAu2vytOAr0otN1WDyTqHvZV5W11qGUnMa1nVz5QlujppH3cYAD9gz7YHzP
	GiEjCRDvxChewGuGHyI/5WTysK40e4fDvmnm087m8M35JzgZh+s8/NyAdHoAIVEV/L0sDU+9dWv
	cb+xV5hP01NtQDgcXkb8JAc1adWTzy112sTdtN90Af/SBusPFkYgbpgvaqt6jnd6ijDOgNn5Nn9
	xCud0DcF4fdk0QcUtg8dsc93QG/sNn0WkSvqL4dN744F2Jo0XbXTYX5tvBBLEXE+V6T+/uHlwMf
	zH8AeAzwX4yBu4hjSy1lEm87Hg8I+56qR7HOCwk+WDdV6ysj3Qx2LEOk6grlGIpEQWoskEvtgyv
	ew9qmLvfw9rrKp0Q2pUEfene5HdOJZjs+MZMLej7ftQOJ9NT/UERRSPHwhVl4j+eiP36zJXTMus
	n+KjLLoQbCbMnQ
X-Received: by 2002:a05:6122:390a:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9b58f8e64mr7724971e0c.3.1790093004434;
        Tue, 22 Sep 2026 09:03:24 -0700 (PDT)
X-Received: by 2002:a05:6122:390a:b0:5c1:781:7122 with SMTP id 71dfb90a1353d-5c9b58f8e64mr7724896e0c.3.1790093003941;
        Tue, 22 Sep 2026 09:03:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d8552fd4sm7707e87.2.2026.09.22.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:03:21 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Message-ID: <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-GUID: NG3O7S5pMH0bFuagCWGXoZZB1gXkj521
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX7rUM1v4qjJKf
 t7eKJ7Q+1VXQ//cl3Q2CQ38TVqE3+v4BGqHezz9TgUpjxJGBIL61af5rZQQN7v74VtFYc7RoZXe
 ppZ16TqcJ7QF01cFXNSf63e5Ys4gjF0=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2a6cd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: NG3O7S5pMH0bFuagCWGXoZZB1gXkj521
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNCBTYWx0ZWRfX1O5DHz5w0A1Y
 LRpwC6padAg48bMYEaJlSQcf7NYpPzzW2h7f4Ndwad9XZyz/nvwrHeb+toDNNAVI8vaiLcwP5zu
 BrAwZaVlvVr6WWZ12XGkd5SQ76xMouPFFcUi0SqItgc2eD3ikQ0oYRssAPLeLez9ejWpp6/H/Yg
 pWsJmamUUjPXKqRUX0EI9cahdD/IjWib68JcRB2LcixnixU/95HxHdvpwJX9SOI0ggvW7uH607x
 YWSu41ORH6sLd9mLATlypErljsBuqGRmX6IBS4CAAcTb8UXFKNUmA0n4MLt6SxPpS9ziTuKyvPY
 mcQ+FUrxJf0aKCR8w5I7lY3KpgDIaWkMpyg4WeRRjO6L5mokvVW8vJ6CFP9kT6Us0cguMdwyKxE
 a49MvcM1s48vXncx1rPw3XE3EBMxmqVD5GawuLgjX9kFy2vCx/esLU1YJ5RpQLBRl3s1qhxXKtu
 kb3xwByvyDFSu6ioiYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220234

On Wed, Sep 16, 2026 at 02:41:20PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm
> Shikra CQM EVK board and add the DLC0697 MIPI DSI display
> panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm4125_l5>;
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +
> +		vddi-supply = <&pm4125_l15>;
> +		avdd-supply = <&vreg_disp_p>;
> +		avee-supply = <&vreg_disp_n>;
> +
> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;

As far as I remember, your panel_bl_en enables an external regulator.
Why is it not described in this way?

> +		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461530;
	b=JLABHS/wkSRyvFMehiWeEV0/GtL7tANjb67qjHMps99y4gfqtLA8BbJFbMkJefQJw/A2
	 5KoBN93AhuHF1JufqNo0DMYo6A9MOr+r4F3kZIlTKGYFpZOYKno4QsS7JMYDHA28faVBT
	 xFGtwQJN1pQOtg6H2PiMIxiGRp28iuimH4lenngohJf2BSQrZ61BCC+bmLcoiqGuWHNh1
	 5IsszqWjJjLd2s/+zL2L0UzJBh6IV/8/W7byxC/IeMfs4aB1rCL+3rSQVEhVNHcYFAbQT
	 EXBPB+MWSJ7ngvaSAlEdCinNtoP4COBF/uBQZbtGlzySN9JVEXcspML1/ZK7Zb8gGew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
	b=tr3XaLkK9SCVahZgMDXHxOMx7SXkxzK6cETZm0dI70UuOHXjp6Omy1lMOLDdD4PYsjMI
	 dFF5iK5cpYrNcAcYaXUqLUAQkBM8Wq3HTfgKM5y7HLp7AzIPdvKSyBjXjya3Lm3DFwjZ7
	 iYAOuPxws8WghfeQfpV+OfciwvlpK1QNwkOkGnUmFiJqoe6uaPjSVhrE/8OlVauignQu4
	 1hAKdwE/zwcAR768QnSuuUDdcDcGAhoxZsgha77ZuNp0llARHcdHJfwnj+I0Jax3/9KV9
	 hYyusUbAfxJWw2ibPpOh6fVkRIx4RpV+xNQ3OlZ5HjtVRpMimigXbAxCDDSzEzGDLRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDgS3HNa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AE2606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49AE2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uzw1GTOv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDgS3HNa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3ZR3475231
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y805Ldq0zOs7VHrpsV5yAaD6
	RgPx1BBPdzqAj6Loazc=; b=Uzw1GTOvs71GjbbnZoQOslKHhOfzZgdwsQk7+dRY
	d8jYEw/EYA9+lqVBIXAIFxRIzyf5Yy/mfZGJe0CZVZ8Xv2Z2JKkYT9IXxaDPE/ER
	hWdV00C+bYN++LgxazNM1aBbiAyolUj/uEKcyDXN0vqzUx+vv0zhXsA4Fyp7OHfH
	3mrdFTBRVG/70UVForVLuCiNzbjQKOz5tmWtCbhh0ItuMKMhabtOIZlXLCXi3elO
	vN/KJ8htE0i1q56G2gph3oJit+LIqBLiJ1/9fs3SuuHocF0nWacg2kQU6p65Px1N
	/MDkQo2gVK6YnU05PTG7xL6ezz6lRfrrJDGoyt/gSBMSYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7tqux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:18:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so734262185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461529; x=1796066329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=UDgS3HNadHxxOgzbCtXIiuvG7cY1oF1hnTToUw8f4tny3M+P3HfpNxLh9r//aVQvqX
         ZeNCrAtnH6LIuaA0uGW+RONZkK99jmGL2DA/8WI4pdk5sTKoCracbJU/VbujQ/u14Kss
         nYIBxlSd9kLyAgfSeoBEZmeo2htahHN0n20pxEcTVUQqoRAhfDMrgTmckXOYX7IJKER3
         zPpIdnnW7JZvP7hyxwRelPbQvI3JJZ//HGQrGzrb6gknWaIcqBLbddTntpUtId7jNhB0
         R+yZO4fjumKSB932k4RauJFeQCXxABI1Ryso9uMIsnUfJtBaBMBBti8KbgGflT5LEtRg
         wsMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461529; x=1796066329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y805Ldq0zOs7VHrpsV5yAaD6RgPx1BBPdzqAj6Loazc=;
        b=dilMh4uzuoW1UvxeyuT1slXTNyFQuWTaz8uzh3ExX1IbGQgrfcdGnnX4MCT5zeetcx
         pZLUOz7DpfT3vTxKsq0kRoLEmS52FTZFWos/XjoKEZRKQzziqbr3C/dSryNG+A6ShH24
         mV1MVnnlkB/BWRyzj7w0/3Mrftw4NbIhYtcbgtCRbvdpx4k2tSedb+/MCB4MgBWC5oJC
         xBHFOywhQprL9yyCmL01o+emhnwmg6cJWUReratHMOcXgaUepjBYNJs9ZpI625rdShTV
         kojj3y1GTZOdRLGpi5TRdxd7APVQTAErEGOLgyL8QwJbix+ticVX9GdAH97cdXNQLi7P
         Tg5g==
X-Forwarded-Encrypted: i=1; AL+hErFkCRsF1zm7fJKv7fv6NrDFMQ2SALI4/rR7rXVNSyO9DV/oucuZJBT6wMPjpgnOBelhh6rSBjXc10w/ix45@vger.kernel.org
X-Gm-Message-State: APuU4Z/UDys7uHxGamYm9sejGD3+U+WO6nF8/0s2wbkbV3nm0q3zJkIH
	6AfHCpFW/ndzCxkMT3vKiyzQKvkGRk/5aDd74RqBU6PnW6py1GwFg0txfzZTJQT1TbQHOkEJIF1
	OkGi9xx1HDyw5BdNT0+51aePtXoEZ3Ttqhz155BnJKz1SpcztL7C+PryD+Zwzm3tSPbCm
X-Gm-Gg: AZFdTZcKkjOdCeoGJ9RUKy07KNTZz0ta7AORUak+CKImGsA3RdkwpcEwFcg45UoYEpX
	pb6MzJtnfm6+F2czA4JKSYXSKiRsMslx7RD8dYAk9oLpFMPnKTme7m+8gTz8KAfJ5Tg8GCxL4TT
	FwnR92gkuZ2+zLeoMlNWkV8V2C8ceCzBLQRwkkaYQrRkF+XfLN1ZDZgEIZleGsEbw3nW3x+dR5n
	ubwz+lKJfgineVLeVYAx4RGgRTAbg+kJfKyfp9VV2SUa7L9drzHcQd8xQ15+pS+Vr/y+XcQYAHj
	iqkorPxNQO2nERfadSWBPuunp0Liqd4h/LLawe7Ys/FeGaUdJtJ/jZUGIFDw7vFaqCtIm4DZ6Dv
	KVwpZBcgdccLln0opXi0Fg7NTxUNCqOht0wqYsvs5tqRQ5Cs5Lx1ORPq5HSwdgbj4
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228550985a.40.1795461528426;
        Mon, 23 Nov 2026 11:18:48 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:949:70ec:7e98 with SMTP id af79cd13be357-949baa13290mr2228543685a.40.1795461527751;
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm144885285e9.0.2026.11.23.11.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:18:47 -0800 (PST)
Date: Mon, 23 Nov 2026 21:18:45 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v3 1/7] clk: qcom: gcc-msm8953: fix csi_phytimer_clk_src
 100MHz parent
Message-ID: <qdf5ekjjakcfjc7cpaz7zrsn3a6krlkktsygr4lvsunmrxyku4@cjbey6jruzhr>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123152722.168879-2-hikmahgumelar@gmail.com>
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b049199 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=ET__IwHBT81aRugf-_kA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX5ubZyUE1NTdo
 7l2ecGpXAqegcZKaLK7taKxqZ+6+X30TWmwLEqYN6yu1LS8mjnn08vigHT2+XjnNGhD6OwWr2UV
 9xTMtTzi7Fc/0vz7Bq5ujg9vt46mReXMg0bf0L43oJ82MQ89KZ7veacfTgH3wjcJ6YRu2PckbbI
 BGsJe/pLlYW5qRIAQy71CO9J1bio8cus4b6M1aIncQwPUNv4SPAm08WlZNn6RgJ0rsnbfnywk9l
 XEescBIeHFqD0lBewAjcy2FT84JSbSjDJEZVd1JnGOvIrk0lsewrsZ+ToTgEaPtSVNYtOXOHx0s
 rABnRes0xRhPZOi/Ajg5YLPTpH3ylXoXyl39XmopMYFV/V3CcdMw4f0lHkMresXVDGh44TD80iL
 rce539mXssfXiG+mChPBHZM22Q4dlwA7oGe5aWYhD12oUKKzCxv+tkPPHmOEhZSS1d/LoDfySjR
 +i7owftPBlE41YqzV2Q==
X-Proofpoint-GUID: OE04KsvghqqG2ys8mXR_pB_IlLE4GpZW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXzV1TQLm253CP
 /jBkGl0W+Nk4DUUNUM1KYWBHibBPhRoqlUFwjDuYL5T9qL+t7C3ANEmN8xncwk0XwuQNkTEp07r
 5vJ+1uwvC/EXFpgntzfvfXwr00288TY=
X-Proofpoint-ORIG-GUID: OE04KsvghqqG2ys8mXR_pB_IlLE4GpZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230076

On 26-11-23 22:27:16, Hikmah Gumelar wrote:
> The 100 MHz entry in ftbl_csi_phytimer_clk_src selects P_GPLL0_DIV2 with a divider of 4, which leaves gcc_camss_csi0phytimer_clk stuck off on MSM8953 platforms such as Xiaomi Mi A1 (tissot).
> 
> Fixes: 9bb6cfc3c77e ("clk: qcom: Add Global Clock Controller driver for MSM8953")
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>

Please read through this before sending other patches:

https://docs.kernel.org/process/submitting-patches.html

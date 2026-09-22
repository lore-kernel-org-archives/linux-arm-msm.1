Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442C5518140
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790093104; cv=none; b=YOg4bNmcOP0qfVF79+t8+dCnIDKcBGrfIcfLgP271LaZCDJ0KOssaJLfG5Z84bSJyJIUqZYkjCMRvfCHdysBWLTBZ/u4AWdkTuiNZ+saAQSjYGGy8+bfTIOrQ0t3SPiYC8CUeCjK24eJgRgJsbkdyv5RFJ+w+WAgVc1g20Cxzsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790093104; c=relaxed/simple;
	bh=skb9nM9bihQYVFuXS1j/3C7mu4OdrLVg0b5dMXw5JsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj4SrHH9RMOF+WT0+GFhw3Kag9xBsM6QJNUxJLUydbUq0zZiMyizqGz+Z3RemIt4ASCOEhoN0RCUEfkApcbjS02Qguavu6EOnDcde1yoxBDGjKl+Sh1jkmykRoFzpIca9WCrBgLgodzD5PbXf72xjy20VJRK4PMOoJDHChb8vRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WL5OOD5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NzqUphZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WL5OOD5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NzqUphZK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjLjm318103
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W6vBg0blR0+AkISTBRJY4Rut
	F5Ms724ptSlqmC18R00=; b=WL5OOD5GSpcjKicPIVXvJVUyfIocWZqrL6k/m9fY
	x0/Cc75zEUaexkJGIQNsv3OUrcdPNI5xfIknOyi6ONXNA1ZQcAlXKvRwmuG1qtju
	ggs8UoIA+K81ruzs7nGRHF4aPYdTlQYA92k6t15GswBl4n9rsLeCIz9Nah0rwUKE
	MM1w8OxWAgBlapmPcFdpOr3xiPho3iNlqLbCO9fREPaH2FxpgK6q3KWzQuLomAjf
	rTjfEbPuup6qS3xfvv/LWipuiR2uhFG5qH50kgHrXu7/ESUVIjKkZB2cWjSEbASA
	Y+hFhavUTmcOwLfLUpUonD1obqp+irR6KJVxfBT6yepUCA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqj0q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:05:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53124d6a362so1408691cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790093101; x=1790697901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W6vBg0blR0+AkISTBRJY4RutF5Ms724ptSlqmC18R00=;
        b=NzqUphZKvp/fN5L7hNnes7ePf+bbkJNtXKmAygyukW8eSvs41wlzr+8sH4iJ2SFDn6
         fFXwFjQRWXLvoAj5u5A/nef+ikKVjKxmcQSFjagUZYCA4OmHwC8tZ7s6bne6hmLe9Uq7
         bQ4kTyQcNU7w8vaYvdZRnkmiY2ghWKu6Q+Oj/Pd2gjyhGX4bjlUrhRGQKfhxKbNhd7RP
         1sRFOjZFFTnuD48bNfXoR5H7jCxVXLHeziixTS9ZuscQnmD1M1LuMWeW/pb2mr5jdzPW
         v5hKzPCLCE8ZF8htrOaWEQifH8RghcxC45AcBHxpxl2ROiYr6h/A3PoVbKG1PvSbkMNs
         p/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790093101; x=1790697901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6vBg0blR0+AkISTBRJY4RutF5Ms724ptSlqmC18R00=;
        b=mR7qe2qwoY8OvIIcCMdxD0MWmT8KMrXLZZ3lU1zndWmsc44F8pZ8GgmZL+nKLxWydi
         50nCSikGGTfWQdjAf/Fldz5NIqwo2QI/1p2LB3FUQqa9t3nL2hdQYhy/utTkN21JBlQl
         ERhalCta/TUP0KCPWxRinqJzlDqOGyi4CS2AV11xx9OQRpMDzbzDpLpIAYqZyRZ4YN6R
         tt9dm3mn5JXN6gsGknBdgsm512kvOQwPbjSA2YNjBtACnntFjbVeUcSHIaSfGjEX5WOP
         erw3Ar7ZfOZ9Bwg43I/0Zc4yn/HtzdnYV8PqaAcwx1dnO2ZtB8aBuZxdQGlqXyZCC9oc
         7PZw==
X-Forwarded-Encrypted: i=1; AKwUvBzgIP+z9G/fnLkpgf/BPfVfL8zKZBldDHirrQAJEjQapE+eCoKHb+/mYHFUHc/pFZIu6dvzqpHLvSDyW/y/@vger.kernel.org
X-Gm-Message-State: AFuF++nMPsk2ss5IFpDpxLeYunn8tYkY04quD/vNKoydL2cg9ISMgatF
	BYZhN25ng56bbS1mwIbvSDwPXtayXWMeiwlAbfBzKz+1WNFb+SLe44+Wwo062Wdtqqglvc6enXs
	9oaopN+V3JKEGfD8LJyVfusxrR2EySJsvqQQ9Fk+p2viXA59Fm8SmkktRPvMTZ5AzAP6HIF+fbR
	1i
X-Gm-Gg: AYBFou3p5nka3vLwc3W+L2RyjsQxEdrgCvwc9Nhia9u/ZFbPxIrSucajhI7rvhbqJ+1
	N4XaUCKeVBccl4WHxAcJPga1rqldw7w/mHuRh75918NgSdbfWt8STIt4zH/0t5tsLQ77F+PfZvI
	fXldEfdXDVWoFmoPLVW0pm+PN2RgxcqfSEIdLks8htGOLaee9Ch4X+INiq2Ct6zYssR+k18yWRg
	ER5rKfjATvZ5bGMnZcboz0z+w0DyZkz5YBENFZ8rkECG7IO/z9WqIc3p49QKhWhqWdaLJ0+0Gz+
	YkBOjQfXnRTJFRje+NW00a53VFCtTqEG0iSu4rk6kUen6wesZm6nU8j8mx6v4WxikP4pKxeEScv
	HU2UZtWX0Vjdnqe/wpScEWeq7Gsa3WsZSVYOcCpFUWaC8H95SRaRv65trX3M7szYwBlVLmHP9TU
	T3wZ3xhXjrgtZV
X-Received: by 2002:a05:622a:2291:b0:530:3855:e8cf with SMTP id d75a77b69052e-532eac93291mr819041cf.1.1790093101273;
        Tue, 22 Sep 2026 09:05:01 -0700 (PDT)
X-Received: by 2002:a05:6122:4f99:b0:5c9:a60d:3277 with SMTP id 71dfb90a1353d-5c9b599e181mr9764222e0c.11.1790093089758;
        Tue, 22 Sep 2026 09:04:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859682bsm2260e87.84.2026.09.22.09.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:04:48 -0700 (PDT)
Date: Tue, 22 Sep 2026 19:04:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Message-ID: <qkhgg5x67sijiialucvzac275zhpjrtt47a4udjpyzmgvilut5@dcrslq3ai7mc>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfXwQxHexJfacPo
 NcDDzZylWIcCkm5VUIfnBbkD20ZBgujCzArFXFr3t+dw5L/l7QMyH9eS6+CNUW6qs6wJBcexjiI
 9ACOFXLlMQQzL7fSeUixl+3uF+YUrK/kaQJycFZEJpfyYCoWCWxgEqMgMWlzc5xGLko0OEh9KYT
 trdIqSOmJ7nGnMsK9eW0nm62PupKe2E/D4DGDm5aRMZ+up/Ftb+0rKFWaL0K1FUYdTmHy2f7DJu
 O3GKEu5dlLhvY0DoOUT7GQ/m+R8Um1A/dndN2Yh5vrhc/RFqr85Bg9DwbBEAIRCu7t7d7opnpJs
 e+OY8PaIqwrKY5Lh/AoLecwc+gxgGDmhVV1Jdmyp20vCyyE0Ri3oRXvtNob+8ltY7cDQd+Nv/CO
 yY+f6Vv+LqfN/NJEJoG3bwVkkpdPu498P25L6MR65mHSaEDS7rmHjMMmGYWZQgng90DRWxhn5ai
 HVc1INT4bibqn69R/TQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2a72e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=c2b1m3NVJlNk683j4LYA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tFqukT42P590YPkL_y52r4jAQ0gxiK3v
X-Proofpoint-GUID: tFqukT42P590YPkL_y52r4jAQ0gxiK3v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzNSBTYWx0ZWRfXyXCMB03mler6
 qnwlid4J2Rt2eLO9JRRRzxFYD7cjK72XZJuwimtp6q3SOTq91PYiTTK/j0G8BnsWBw96ujg8uHk
 6bvPw0i7S2rrezAJ6NEY1A3lm+qZZuc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220235

On Wed, Sep 16, 2026 at 02:41:19PM +0530, Nabige Aala wrote:
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
> 
> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
> board and add the DLC0697 MIPI DSI display panel node.
> 
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++++++++++++++
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
> +		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;

Same question, panel_bl_en should be a regulator.

> +		pinctrl-names = "default", "sleep";
> +
> 

-- 
With best wishes
Dmitry

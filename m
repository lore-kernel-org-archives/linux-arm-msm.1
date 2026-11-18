Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991176;
	b=A91eaaqZ+bpzKOW4BTo10xCWFEKwYaf149ZE8gEFrHxB160UjiBoTkhlmEOEu/dCgWTd
	 I8o/w+mqpxiflaD8j0/JMwAdnwA57hxYvFvV+Q4EEmCrJVECffzunyGdPmG97DH+kGZWh
	 qyvXFtggRvYrBhP3xlLG0KFusJdofM5Ej8IFHT5fPETwVQOloX7umjRW6LCufNocVKMFe
	 ftR1w2UYFyLvOjxnZrlJLiCSs7EsjWlo3RzfCJ+Kvv4bKcwHyHiFeJVDqS4kzhGQTpFHD
	 OdG+Z+3dbhHd2Vi3cNl0xaMk9ooOYLqr2tmxuELfkKAygzAN6CykrKOemxhAiI0qe/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0Dj1ynDX3waMGmAeYX9fE7jNOmuB7Vkp2iidk24GgWk=;
	b=ucP1QDzX2X3aUnaQxSyVioHZ0OcWycpqQqi6QQvDCa1A3qW6yNI/gsqokYKpfVBJI2hQ
	 AlQtUD+AmkCl1eJDr1wrRZeLtgGGbDQR3zRLBUOVH7zwnz9T3bz8OdKWeT/NDbWxWG0qo
	 0DYlS2QRXpDpHLwQzmm1EeOBXJ3z6yG/xKedPlg1Q1DXN3BpmIptAqmaUW8QHXQY/077N
	 68vddqheJg3z4N0gfjzag19Du0YR3U7ULHPjROcgNfWFX6+9xoDNQCEv+amilswV48td1
	 FVmgxGIEZcWIfw/bVVQFlbdw7G7uHxo+15JRaJvoPSipIfsvmjYOdq66s3EXVbhvOMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5Te1uVY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dyQB75yH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C40606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5Te1uVY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dyQB75yH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8PcOB764130
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Dj1ynDX3waMGmAeYX9fE7jNOmuB7Vkp2iidk24GgWk=; b=C5Te1uVYvk1Sw0jw
	cCMDN/8cHsBbYY5R/wrLk+xWOdH3SorxapqkFSBNEPq3yV16cmvFiH7s+9EBCAkv
	NDfEKe2xvFnKCXDXrq/oh8kU9kyo6f7we+fWocXyAhqo+OSkej1jxw3JsLHgnnja
	Hr4wf3HpPXE/5GdpoqTihI8oVWlMtcJGcHptbLpjThNcFshg+CPgfX/TVKcl2o82
	vmZeDGoiLmPgBWMPOS6A8vLDLuRUIARoD9+Ri79S6xIgRK5NfbF/t6KSU/VOlbd4
	NekbTQPGkT2Es5O7ttdCGNKCFnkxiJhGzyksXz1PQTZeKckrVKumwnKJ41baX7Nr
	XsZ5vg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvba3td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:39:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so722513a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794991175; x=1795595975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Dj1ynDX3waMGmAeYX9fE7jNOmuB7Vkp2iidk24GgWk=;
        b=dyQB75yH6Wm1iw5XMs8qyaso8RqtDoqXOSmzV9K9O916aZLxnTxdTDIQBh+2bB41Gv
         bV3Bd1gAp8AejL7Z/Hq+Aumsu+O5BIcoQLKpAj6fISbo7znHGzhNzTS867IzAIpLXIff
         McUyIYpHTe8PSjiYcT9lScc2rMIb30U7oiS998yv6ojXyW8GaTrAALkdklwxReK3CzWl
         YJ9AZyZEChuj0oFsRqRL/iERWZB7zRpU8UNVyggsd54sK9goG8/5j9v9Xc09AH+i7emC
         dah3odZ+fi6t2YiMymxWFM3tkthhunn5sDJbqb4W9M4KkXIYTkGXA7+w8UBGaPsToUnU
         CssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991175; x=1795595975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Dj1ynDX3waMGmAeYX9fE7jNOmuB7Vkp2iidk24GgWk=;
        b=cgFo1858cT78eKNUWP1yMV6djH2gNbgkgdCAQ0AmRmTSQP29YsG+CC1IZ2P1mITxt0
         G5Q2RQM74fLKLtQMcB1ihNIFFjhxFeJ9vrr2hipbW0hgL2OVlxyPmTanKEm12RYG9fGF
         2QtwuZExSDEEN67oz/4hLEe9y/K/tO7vR+spxZ96e3UqmUCE/DiF8QbZQKLO7heWQBNd
         u2AlaxQKFB3vSIVPcmnACdKuFkyzeyqTbEV2SPySeCtWRsDCOJt24/kO9a4+yt6psUOP
         p13lC68390ZbTMOWk/rAK0lw/bCMQo0pphqKjIPx+QC/Vmq9CXUt5+JcbaPtZ15F5qlM
         JGLQ==
X-Gm-Message-State: APuU4Z/5VFUZu0Nyc0fygdYu4hsYuWeZS8oNA1xs4BDYKPpBa2+8os5/
	izoUKkKUHn+A+aNhfWw2eDILRdrP2SwIIKHBUMcRZjKwRviN+ZnZISlPrsHpFQZnFCsFqPRc0Cj
	u0yz3WNjOB9a/ZA50+J1AEMiqvynwqBYHd6DQifcDQQTqbbnk3QeNPV89dI7D+WkllOyjX7e5YK
	gn
X-Gm-Gg: AZFdTZcEwNCnqUf894PwMbMD8FhrOPcn3ACHaitKlrKI3o+4IIasocrdPiXaTGCbg+L
	/nZp55M7yHaEAf69aJIGFCbx7X0KnM2U90u4AQStPjx/BzcdfB40cEKbOr0BkdPjQEfzH/oTx3H
	Aj8Z7r2PPSvALBsLWenN0JXXBDO9TEHG+RqxO7QyxW3Xik1k64hvxFEl8KaTF7YVtzAal9DptC9
	TpDxFZGRGFPzZKa2MSNKiWezIdngPlR1WM2ufFQLtjSwQZz9UTYiZVEx0GN01o7WByHTGtIlHmB
	VWWj5QDMpIwBQEl3GWtrI+Jln4TAwCWWYPOe+IV4Nljpw/YnPVO98oBKolPuTQUP7dL+vukFB08
	AK9AyopdByFvlp32/L9niSGENu2xxEtoKaVGWbjZ6AE3Fr0aYEZJxn9cRDYmlKsYQWnNauN/nTw
	0RB+35xJK1h2IBE/THpevdTbW9BiTU9dYd4mLMkA7x7pkscF48WMzMluV5KE3n4u2Qhg==
X-Received: by 2002:a17:90a:d44e:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3b3d0764a35mr1981184a91.35.1794991174500;
        Wed, 18 Nov 2026 00:39:34 -0800 (PST)
X-Received: by 2002:a17:90a:d44e:b0:3ac:af8d:c839 with SMTP id 98e67ed59e1d1-3b3d0764a35mr1981176a91.35.1794991174085;
        Wed, 18 Nov 2026 00:39:34 -0800 (PST)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3184610a91.9.2026.11.18.00.39.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 00:39:33 -0800 (PST)
Message-ID: <97742a58-f552-4dba-b769-143d428c7393@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 14:09:31 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/18] pinctrl: qcom: glymur: Add gp_mn mux function
To: linux-arm-msm@vger.kernel.org
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
 <20261118-gp_mn_tlmm_support-v1-14-703f7badd194@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-14-703f7badd194@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MFYoDasNGCMIC8hJU_UoHYC8e6fR8aWS
X-Proofpoint-ORIG-GUID: MFYoDasNGCMIC8hJU_UoHYC8e6fR8aWS
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd6447 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tOxd4B0K2KtdnezaQpUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNCBTYWx0ZWRfX1cw6uscWh1JW
 +FrsqsBGUXCTEffY5Ji2pefZ7zmAx5vO8SkZ0bRgWzVR8dljxdJb4RysA6+Q8gfDKVbI+ZjNIc6
 fEUvEjau0HLo9uEvsfvbCI4ORohXb/M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNCBTYWx0ZWRfX22ilijo8O37l
 BSNC7flxLZIDphwOMfDBdk5cyk9qR6NYcVKWGwmVH5wOq8tUtTyBlvB1sTWXZ1CVBLRtB5HpJE/
 2aChMIhlTsiNhJ36M6gMi1o7e0aTk18AKPChJIbEhcQYdguA8n+NPho2FRL7JELhlq425kCw50d
 2j1IlIhfbAmXQIwwjb6q389agMg47UmCgDtznxBvBElBa3g1S+0VggCiHzkDCluXqF/3vI+38Yk
 DqejfabsnTEhsXDuIyuoi/GMjJFgjY6O3sH4mabtjI+PG6a3t4+/OM3TDKhAHc8ezSi/JhTezWc
 gxcQxJ5YtUiaEDpAsyiHRn+3Fd2hW3ERlw7V0KkvSnX9vxmph4XYfm6MtLNJVtxeefRPnN4GP1b
 SGTZMhF2SVjl2ML8hVozFVF0A7pvQ/PZwdeqYSpWJOVLgAxZPOyB9Mzwq3HTJZCYL31zofOUcfv
 rxl3AC6Tju8tr5hBYvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180034

On 11/18/2026 11:32 AM, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio53 of Glymur. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-glymur.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-glymur.c b/drivers/pinctrl/qcom/pinctrl-glymur.c
> index 20f076e59375628102324cb791dd7b269dc10fa1..38cef09659965485b3fe8827b91b561ea8c9a2ba 100644
> --- a/drivers/pinctrl/qcom/pinctrl-glymur.c
> +++ b/drivers/pinctrl/qcom/pinctrl-glymur.c
> @@ -645,6 +645,7 @@ enum glymur_functions {
>  	msm_mux_gcc_gp1,
>  	msm_mux_gcc_gp2,
>  	msm_mux_gcc_gp3,
> +	msm_mux_gp_mn,
>  	msm_mux_host2wlan_sol,
>  	msm_mux_i2c0_s_scl,
>  	msm_mux_i2c0_s_sda,
> @@ -931,6 +932,10 @@ static const char *const gcc_gp3_groups[] = {
>  	"gpio82",
>  };
>  
> +static const char *const gp_mn_groups[] = {
> +	"gpio53",
> +};
> +
>  static const char *const host2wlan_sol_groups[] = {
>  	"gpio118",
>  };
> @@ -1344,6 +1349,7 @@ static const struct pinfunction glymur_functions[] = {
>  	MSM_PIN_FUNCTION(gcc_gp1),
>  	MSM_PIN_FUNCTION(gcc_gp2),
>  	MSM_PIN_FUNCTION(gcc_gp3),
> +	MSM_PIN_FUNCTION(gp_mn),
>  	MSM_PIN_FUNCTION(host2wlan_sol),
>  	MSM_PIN_FUNCTION(i2c0_s_scl),
>  	MSM_PIN_FUNCTION(i2c0_s_sda),
> @@ -1494,7 +1500,7 @@ static const struct msm_pingroup glymur_groups[] = {
>  			ddr_pxi, _, _, _, _, _),
>  	[52] = PINGROUP(52, qup1_se5, qup1_se7, jitter_bist, atest_usb, ddr_pxi, _, _, _,
>  			_, _, _),
> -	[53] = PINGROUP(53, qup1_se5, qup1_se7, _, atest_usb, ddr_pxi, _, _, _, _, _, _),
> +	[53] = PINGROUP(53, qup1_se5, qup1_se7, gp_mn, atest_usb, ddr_pxi, _, _, _, _, _, _),
>  	[54] = PINGROUP(54, qup1_se5, qup1_se7, ddr_bist_start, atest_usb, ddr_pxi, _, _,
>  			_, _, _, _),
>  	[55] = PINGROUP(55, qup1_se5, qup1_se7, ddr_bist_stop, atest_usb, ddr_pxi, _, _,
> 

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>


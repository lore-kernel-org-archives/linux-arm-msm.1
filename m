Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE44E40EB9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109093; cv=none; b=sZGxBfv+UXubYbLz/P1uQFwnf9hn0ybApocWdhz2QZgcU3j271/fBPYPQWonvKSNomthT7ZKuGf7tCRqKD9A4JqqHeeWscK1RLKipu1FfqHwsmKbfblfP2rksO3ML+ITR2JdCkCGwS4zjl9mvXYIl2rRJHkB7roc5mvNtrBR3jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109093; c=relaxed/simple;
	bh=2SILvg0NRELw7Nyp8PHvnzfGtHVKPwkLNhQMISSJheE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubxTvngvnKD0muswf2VvY2Uszi3L5Ndfp7WxRI4ShpSdTp0uosM4osZtnTUFKXYRLriQn0kjDVcUFHS9EZLulVHZJd8STDQ7gi7EU4HBVPBQDF5DFDaMjL1T1uYbVVo6m1Nvh51TvFToY9taOBYqipJO46NXoXK31wD8+tb/t6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MunD8rhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E6aqTgn+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MunD8rhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6aqTgn+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7QNr900432
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SOdGFJHM+QY3bQbQemDVAYpt
	gztbGbVsScvPY9HEk50=; b=MunD8rhlSUsNocyd9LcmWUU/fdjKDNQZi3JSA/uS
	Mcp91FoVAlQPLsCNC8zYbmOSBlvVbp03jkwp9aMDlYiJtHIidZRtIjd6J/QZEZCu
	6VjLa8JUUGMdGERs4toWO/ptXkr5aXaidp25cBCKU6zHXcbgVI3qBIMc4YWcLq8Q
	atLCS3kNqg6Hu9WKINFaIdJfda7fc4mPtrECZF/n+5N7pIrnrPWS5jfXppFHHshB
	5k3d5akJKIQhi4Hwe9w4YlMefpyovbmy5/ClBBXzWNRWbu28GzRQlEeNFOzNnt9F
	8TS06L4gsxqPCfGTFVqlgm6W3EiYgKN/kNyLI7GNxq6I4A==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyunnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:31:20 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78f4d6af128so102820137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109080; x=1790713880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=E6aqTgn+C4ON8LM5Njs+KvJ99+mFGsXuLJZY+gNg35SNgNPIuGOxgCabiIH1Uo8ogH
         3cb1nKnLp3HqhSjB2ZaAzrfT7DkijrzDArSN+QG0zB8ixR2+1BACXWQwjCoE5oI1ni01
         2mbLXsSM7GP30yfszHjfCdD9Inxr3vKbTaIqoHwZ6iE4wezuWxQWIUpjYO5nuoRqCO70
         uWF6Rwuv8uj+UpaFOyqeidAXF29Xk6oRmRV6LVKZRS1Ph9Rq08cFobRApEltvreE10L9
         3zLB5gI++kxx4U3Li/I0wcc1fZ0FOATIJ1IEVr1J9U2C6sSk6ZobovJkZdo2oSSHoM2x
         4Bvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109080; x=1790713880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOdGFJHM+QY3bQbQemDVAYptgztbGbVsScvPY9HEk50=;
        b=e49uBOkuB317OODg+iZev5iSaMkLW2q+K+xXkTsZw0/2mz9Sgz6XTQbnTAaBu8ab+V
         2MfVy3Tr7jDKdKigI0vFoo0ayHvdK9BxchfmtRD1t4VPI1lVvW/lVIZk+YbM3WDRWrHq
         DQIn0/VwXjmIOsbMvtRqu0TvYe80yBE7jYpx9CHc+UEMAuj2fenS9dvYmMooyNUGox1/
         wkJJI7fEvMPRVB2z2HdacLBK4PN4WRUY+wsyVaZ6wBS64R+d2Bg5rDwqM0zzjTlWt5y2
         PgVpmq2PYElmXIbgbFoEdEm8sn7sh0W6cRpxbdb6jp/pmC3528Kwf5yXPcyzE+p7XSoM
         GOMw==
X-Forwarded-Encrypted: i=1; AKwUvBwcvAkVHUVCspccEzQiZKl+1SCc56FGHZuGE+49RTktZC9Q4cqPVFkpy0ReQlL92YvQ/pnXpFFTomVS5B/O@vger.kernel.org
X-Gm-Message-State: AFuF++ltTwduEAzbZyiyW1Wkqbh1ivttwgfJmP4FuKpyOu0TUjU471lJ
	s42XFPRmZGx3LACfqJ7Hv+pgQFHGhXImH5ORYsYIcClq/2IRdybcjEQl3WAA7K/p4H/U8OkuzkE
	66Vq0tsiPz7ZBOXWibfo3Bs7l8lTYvd4MgdnuIjuZ7tPw9+svgn5x4ga3P3/ifXntxQZU
X-Gm-Gg: AYBFou3KLU8PpKlZkW76gTCYpBaKyfNLTXPVxS82zjFskB1yTzrqzyp8x/RQHOzWnaJ
	eycYPwbOWN1+Gw9n1mF8X/PuissEiY2uSjNWRbu4GW7mblulsDk5eIkmdE5GFEOzEaLI+6zEQvB
	fE+qYDoNj+PRkVwUrHUNG8CvtHDfi7sXGXSqpK1ngmNST/SSFnteyGSPbAh9e28/JhEp6vLWhsL
	WvZgH0jaeP2ge2ouknjeAtToT2/GmDfhodBc62t5xXkefX3twezwN4miBmGXYeTZeqtg6jfOA/6
	xHKLTz8xe8OqY5IHPI1dBkXDwqL1oDxY+1yooDpWdq6ElrcgiAz/aA4QKp4ZL+XBV1ZD3BRixL/
	nB9G4xYnjwY9wI3SPpUFiTD50hQ==
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630624137.11.1790109079872;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:79f:5d5e:11cf with SMTP id ada2fe7eead31-7ac1b625004mr630541137.11.1790109079268;
        Tue, 22 Sep 2026 13:31:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm5738655e9.1.2026.09.22.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:31:18 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:31:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Message-ID: <uv52rxc6llmlas45mejbeeriryiozh3v2f2itbvfzo4f2sgazm@ly37763jkftd>
References: <20260922-topic-asus_ec-v2-0-0bd923d1b853@oss.qualcomm.com>
 <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-topic-asus_ec-v2-3-0bd923d1b853@oss.qualcomm.com>
X-Proofpoint-GUID: lAO5HJ1pPPaMnk22BZXqCohF8hj9QfJl
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2e598 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=B_ILVBOIu_Z04Xi5GswA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX8R3WAjCBo3V8
 gUUVY4Y56bT+x+IfM6JGQ7OFsu/aCV0o06qxxoGVHQoXEgPCp6XoWzNeDvPEzfDw3/JjJjY7K4F
 1D9QImS/QKzzDH2PpWCtntRxqJQ0S3W8NVGnLSmmQKTQ/jnOB7lclGrmJB+P7v2lEc3hh0ribiG
 ME+y2bNQmwcBW6DEjLcGlkipWsNva3KeDjnBO3nbpAKzBWAnYt47ZwaO/e+tKrCCBJrSPFMSF5G
 uT9aE2YFlGUC3GS9XDCTUGswv7ZKxQUnNe0iTxvKKxMZC+4LpNNJx7bO5/1XsJZ28fghFFcPyD1
 uq4avpKNX+hP7V1apXYjFp7mXILcVjMilkqx5XrlOTszZF+vOp/8RBtbpt2Kg/10LuF7Msqa4uH
 FsFiDoRXuAx4CD2Ewo4jY8voUanFn5vlD4QybtOZ88whGCyRVNJ9fESnuWs/KrQNAjfA6WRA5IX
 2GHu2F9BPMzu9xAqtSA==
X-Proofpoint-ORIG-GUID: lAO5HJ1pPPaMnk22BZXqCohF8hj9QfJl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfXxumvKqQdHM7p
 4JMgC6ePygxJmTu3Y4RPP4dBQ847yfICMCXDYlS7Hsl7JLkL4bp24jj8/nqzmCRX7gsxPnFS5g9
 1mNkvzdrVNZswdH2W63pUWJW+uOOzNY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

On 26-09-22 11:33:38, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
> 
> Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> index 40433dc2d6cf..d3356fcd25f0 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
> @@ -670,8 +670,19 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	/* EC subdevice @ 0x5b */

So what is on this address then ?

Anyway, LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

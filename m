Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352269;
	b=gaSSbU9fA8OQL6ciAiWjt6Ba9uhUKd6yg00CVnnxSGiDqFcrlzNB9UlfpnQ1gKFN6FjJ
	 KuHWM/S/gqUU8HG/ZlHRQ1l8gOjkCka2bD5G4Ilz0fLGFmKPFMO2+cbKuHqK94kKsvvYI
	 PW6L6cs44EYeRJ9SYUg7M35b2racQTi0//fv2e1jfSsBIOh0dbfpCm4pyinucbHLg6cSL
	 AeSN/oWSWZXGSz+3eLSh7NMg3bbgHp4PhimTncpujL93Zlgam3McN9mIFJNlQDmCsK1lx
	 2wBwx3ibxNOp20eRHFWSLz3YErOBFK3v8tPuiRw9lRE4zy82olCH79WosNg8nuD+mdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352269;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MYuwVSfjiF3KTXkOBBaPxo7y5cx6IR9zr/hjOjRZlOo=;
	b=hJxFmpy2/VWGm7Pi+1bbKfxQ0vaNimZy6gs90cVtVduN4uz/Dkp/hTLFpZV9TkxYH19U
	 ZBQSC+owmbyp0TfZ+ox4R6YGjPvhvuJzeMpbpwlsopslFj1pRgxRDEKX38BPGJ5pZyruJ
	 lrl7oGSen+pwiTVmw4uCZiDPlCdspqIPeoEXG+pA642gEaZJnzgAUHgyJXZ4lFfueBeBu
	 b6qt15KVv/LTaDdKMkT2W7HjUpSUE+4FQsrN9vvNCrw/21quKYTZbYSbLjZvp/f32XBBR
	 V/krEGv6jfS+8G78HSuRLaPfTeEUVEcnCc7EjwVO01R36Qo7dTe5ACp1kdHZAqKPhwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B7K7wAR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2riCNHC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCEA606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBCEA606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B7K7wAR8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F2riCNHC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9Gt2374156
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MYuwVSfjiF3KTXkOBBaPxo7y
	5cx6IR9zr/hjOjRZlOo=; b=B7K7wAR8/TRi8IXgGlzFrRpeKlKC0Nss9P59K2Dv
	0tZtmXcpx1/o3RURWhJrItGVzkkronq6lfrJMYqIDeb35AqaC2VsvygBzOmOCbuj
	XRLPbqdAP7Pwp1ICahKOwyZiTsCANJRGVumfbun41UG7BRRsXG7GDsKxpT6HmgUs
	vTYNPv1Jr56g/Tg1beI/lHpYtQf+TxsYbzOQYV/JlShTfRmR5mgkpBAaNI0foY69
	0I8bsMCwI1vo9ouh8AqFmnP7deEup/uW6saayMOnnGSqgU9nyJvO7xVuYK/18EgB
	+RGKpe+Jjgu/ykOSp6Rwu1rN6IAZJCHtbtAFv2YfZjbUPA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qj75m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-189d17eca17so474299c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793352266; x=1793957066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MYuwVSfjiF3KTXkOBBaPxo7y5cx6IR9zr/hjOjRZlOo=;
        b=F2riCNHC7FVT5rd/V4GytVGWZqCgjrI6elfXyBd6z9+rdzUZe3/U6keSrdv40XA/cX
         NWM7nJBmpcYa26fzIl18N3MQPCPG7vZYyO3DVx55A03F2lPpP8qD0TEoc02ChRAK7rDM
         YfYkCPXoAmIHGWyRcvPpFT35xPnbXXFBuU6Li/Ie028m7qedEjglP5KxiQjIBsUHsA/R
         xDYPiLi6pS0/vD+m9pYaqKYUcnErUtCSiw02dtVvkPeK46LrcV4dPTkCWrh93VHUJZWM
         ILSXFER3ltMxzvIeMV6c3vSHNQ9Hx2iHJRPV9Nw3WmnV5dQEryYm/802VcBKvdmfCztG
         GEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793352266; x=1793957066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MYuwVSfjiF3KTXkOBBaPxo7y5cx6IR9zr/hjOjRZlOo=;
        b=kBwzOPoga6szqxZEjhs0KG7Xqu/XKxmt2ARFvp4MeJ41XgFUYFo+O5RMASXx6+uL8o
         kOJx9jjmkUDEAKqRiF1U8X2T/8031M0f2PirflzLM091k31IgLPGQDNX5u8mZ/QS3Qvb
         ZIxmQhTlIzWYtViySLyRmW7UD5bM9n9XxTpI38hGkh0q38Io63Lp6xmxFkz9PW6G6v4T
         A6P5ERU8wvzNMF3d2tLZ977nEjuWsJSY56hz6pNAN97reDwnc2ibdLVzW/I6hq4Tv/5i
         6/wGPV5jf+KXAXL/PqPfTJVEetVl6uT0L290ObvU9G2lrGDmLKY6eXzKT1vXMOFBgj3l
         UVuA==
X-Forwarded-Encrypted: i=1; AKwUvBzVzIqjG0OtudaKx0mke1HeWssVVWGoKvZiNjfW4mW/aLBvjycxCSjsfeK5xDjRz7d7LE7GZbi8eRgIJ+8B@vger.kernel.org
X-Gm-Message-State: AFq9FYK2M/Is2yzlpJK5jc8tIKs/UKJq9CFq3XlKXmmUo/ZyNytnuVdK
	ulztEmyT4QoEMA9vyiyG1XA3t2hc3sxIny373f/aUehBcVSMAdLbJQnj8E0tKXPHq2E2Qb9QgVk
	vHo+Hdb+ES2mBi5Tv56GTsTO/rAZKALSNZlrOm+ZxIFf6+MwXMjq4ALG6yaTqjuXQXn/w
X-Gm-Gg: AYBFou3yjThRrna6Oh6TLqE93D1KeMvU3SaiCKTt5qL9Q4h8BlNArCIp3H7P+4DDJfc
	6dbPTNyhuyRaUQC/G7o2ITCpM9EEzg2R78zv5hme+Gnc5fPrPy5zdLYlTopD0pR2vlcDNXn+OQ9
	kbRNrIwCdf4MjnZLnHjALYmy+Dw4fdGhouW9AKvlUJoHdigqTQH91NF72VcKOJZM3vnbiFtclNQ
	FYeSoG23vX33WXdAciYTBgOBp+KJk925qC5qiIA/HD9QctmYHmIN7fC1JRSqJMhVOAYIvQF2sbw
	SZb1WmPPB5Vhq9e5Vfkz4QNBc+ezneYajxvp+XxCUkkKooqc7+FnWNIHM21B3wecD1UbGo6uW/U
	H3WVhfbwC6WjNck7PlszJF8ZpbzvsrHlujhMeqo40j+ezaziPOldApDQBDCVAYxADzqy6BpAvBX
	OZW9IlUlyFJzwZH2z94PeeDQ==
X-Received: by 2002:a05:7022:eb46:10b0:193:1148:64fe with SMTP id a92af1059eb24-1ac56ca032bmr2558388c88.6.1793352266310;
        Fri, 30 Oct 2026 02:24:26 -0700 (PDT)
X-Received: by 2002:a05:7022:eb46:10b0:193:1148:64fe with SMTP id a92af1059eb24-1ac56ca032bmr2558348c88.6.1793352265714;
        Fri, 30 Oct 2026 02:24:25 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm5277885c88.22.2026.10.30.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:24:25 -0700 (PDT)
Date: Fri, 30 Oct 2026 02:24:23 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
Message-ID: <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4624b cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RK6R8bCIeNngQi1V4PYA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: jNg-1CalvjKDZ9LDcMEobaqzTx9POxHX
X-Proofpoint-GUID: jNg-1CalvjKDZ9LDcMEobaqzTx9POxHX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX1topF0sFFKeC
 Q4+Z/OFcEkUn57vJsg/ZL+ZN0A3T3yIQrUppl3vGSvY1h2HiKpQO4WDnPNapDxoShN9PBxV54bj
 4mOXXpGSpYp3Bb4HNz0jrnwmZyu6xqvUYoSWUKXrZ07TDBcghptvaUX3Dktn3WzR/kTU80otnsx
 /ZDsfTqWwqs8u71uu0cw3EbMsAZ01J7y27couUOEWXBeRy5RTosvkEeNqYNhIuhM7rM0lr0GG/E
 x2EY/sUsIxI96HJnc6/HLT6wtpbetbeWMFHurGk8WpZXoSdzPlkMWMb5XNPSZrIJkfkUq5nZ4wY
 6Ka0eM+srApGmiKHDjy1BId5gs59qLdMH86yGC24EfUJ6h0840i+COV6KS0jKu+Jcp6w+12V8OD
 jmdgnVpOX9RLjEc9R27Q5AL3bEiA8BQkkdUVWnGyQmVuXb2vKiHWs75/ZgAMdi0KDIMe7XhHv0N
 GfPZ70/j+33la1R6Lzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNyBTYWx0ZWRfX848zu6GW+Sed
 QnUH3FuXEHsKEe02Xju/5rsR9gXmQL0Dy83vz2rxiCUiim21s0LSewrY4ZGzn7nYvaOguQwYS4t
 /tGm2i6xq02D9KIlgd8eM96MKBtXZLw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300037

On 26-10-29 00:29:31, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled.

What's the relationship between clk_bulk_prepare_enable() fails and this patch?

> The next suspend returns early on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again. Disarm them in resume
> regardless of the wakeup setting, so interrupts armed by a runtime
> suspend are also disarmed when system resume runs with device wakeup
> disabled.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index d44f093ac243..d4fda4dd81f6 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>  	enum usb_dr_mode	mode;
>  	bool			is_suspended;
>  	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>  	struct icc_path		*icc_path_ddr;
>  	struct icc_path		*icc_path_apps;
>  
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
>  	int i;
>  
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>  	for (i = 0; i < qcom->num_ports; i++)
>  		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>  }
>  
>  static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> -	if (dwc3_qcom_is_host(qcom) && wakeup)
> -		dwc3_qcom_disable_interrupts(qcom);
> +	/*
> +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
> +	 * even if wakeup is now disabled,

How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
hardware default value makes it enabled? If it is, we need to disable all
wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.

Peter

> so always disarm them. On failure
> +	 * they stay disarmed, as a level-triggered wakeup line could otherwise
> +	 * keep firing while the controller can't be resumed.
> +	 */
> +	dwc3_qcom_disable_interrupts(qcom);
>  
>  	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
>  	if (ret < 0)
> -- 
> 2.34.1
> 
> 

-- 

Thanks,
Peter Chen

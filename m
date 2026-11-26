Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687945;
	b=oLxxFKPfBOU6tMbgJEdIyRp3CxtWSzUwZLw8sz9kaxLfmiUkY2XPki8R3P5OQGB4VI9X
	 L2jrhV6gbmEoD8YOPOjNxL3UVoWLX0MVzCzDdhwr2u84bUpjRMcVoGI7MkgvcCvQp+Stp
	 9dNjouo7+Po+RWRQ0OQim2RzZo5DaFcKIO8py640yAVclcSK1g7GBCPqAbVy/Xl5RsKIY
	 8Bi3Q7iOzomG+nBvAV2OoC0U3Do1j/PrxrHBfIxuoLksLhhYi7jkA5Gfrv8ejbg4g55Ml
	 kItR/6j5drzTMfS8jcjVUlkAVvUpB2+0ORXrAUqwi4qlK4TRlSYYSE2/2z/kMDl+JPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
	b=Yzod0vcWHzWNZEyW+nxkgfwYjbe3qsKg88p9hoQui2UyI6XWpoPdcmt8OHyn7QFX37sx
	 EJe6yCBBchCOgrZhsuzbUUgwaR93XA0JlP+CwASNlLeuOAUYvrfjPyXzh4TkiQcMAalzC
	 XVcLkrKU+l/PnNRRQd7i+ZM3MpHV+nqaFA2sU0qUgLMqGt1/Fvr77tkpFrc6ejs+lZlks
	 /lpaLRKS+TZrLbADGlyXevCb+9oq+7KFUZgSQrYHjMfJFO52smEc1bQqJU2dUQ3pbZKdQ
	 LZ5oA/j5U3Gv14+o1bvPf0xi4HWmLzJq5yaB3MlRVGBsjZ74yk4mCaxTDukhtVXaoGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F376606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:12:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F376606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GYoqK8CN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f8q2npDW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Awbc2175562
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=88afsBd4DBJZJXNBN2MdesvR
	9kKs2U7zYJzInFyRPBI=; b=GYoqK8CNmbpXI/XAZIXWy1BCQTbfYjkSAYGNe0uk
	oyB2cpyJ8jC+F8LetXo2cqGdEUUl/gu0SVDDgcf0dbwCW56zqRRByFBD0MMeN6yd
	DDEsA7dq0oqe43XJt/j7D1iw7gg9xEKqBrXTGqFweEcrCc9stnxkyove9DnNG4hN
	3sRcFNdJv9yzoI3NalvvlNLrqOZQSa3M5EuSmd9f//KgVLBjiyF87+CdHg7sMrnU
	043OBZbhOBG9evZzdsZlsFIC7rAtWgydU/nzVB/zTH0fe9IrA6Of0UkjxIvKmql2
	mGCdQJpAsBnB8+4Nzd93v/RuUQ5CXdmXfRrOMgiE0oV62w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuxty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:12:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso7384188eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687944; x=1796292744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=f8q2npDWeyMusPOpBiBYQ2BjTAlMpAEMs0MoHLCd9uJK7UkqQGMsilOi1IHA/DXKmm
         fW1rBnDfiatVDz5lJwZaFgrtDviXx2FFMZ3aRsB5VhFzOOEOyGBLLGDwJ3PF5Q1Bl54z
         ISYAPAYxDo2gR7/FqQ3BnvIM9o01Pd7pPKhw3WSqGuwf5xvY6P/Tqff56p2yAiyQfOPq
         sZMBmF7tSI/JbgmsM+ahE4taVkS7tNyepkYgaODnT+pupD3xNXl9xBvvkeYg9lXPZVUL
         raH0AjLU6Qt11P192i93wtd0bY4eawZfAEhF2sbbFxGrKCfmAV0jvvvKqDF0+zyotB3F
         7ABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687944; x=1796292744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88afsBd4DBJZJXNBN2MdesvR9kKs2U7zYJzInFyRPBI=;
        b=xIvraC63vZ2zAk1WL9T/k36KOfWkAVxjwse/22PO/STfitAD2sv2QUTsXSa+L9PlK4
         ow/Ldh2RCWigfCxRfK8imRzU3lSzub5Bcmrg+WPUKtsbkP4R+sruTGJNEykxt+ixS7zq
         lUpk7e3z088x60nsw18i+9h+Iy39ne8R8e+QqUbeYOyHifveSs74JVRA6tcrUFwzRpMO
         nQvLq4OvX+2udcaFP16KNr+r60+hqOwaM8ARgw6RO1fmwF8AdzvbSo5pAORy7jdbs8Gv
         m7eU75DINV4yfb6xSCRGvAGotnPobRE9XOjVSsUP8ScP3rt/j43ObJKFTIFXc6iJMTFb
         fJyA==
X-Forwarded-Encrypted: i=1; AL+hErHBLN6Xa6GU8BwfR33qCSXRQDrnd4bGBps2H6eoeJzaT4yxi2eFxukHynnhORSo1RHSxuQuwB22Ug1BHH3g@vger.kernel.org
X-Gm-Message-State: APuU4Z+An06nva38Kp9CgpmXF99JzwOCkmfu6BgYpvp6AOFk1Sw3+iZn
	cwddsPcq8ON7dvAqsIEDQMdJh3C3fCCQzv2IH3da0ywzsp62ONAYsw3Ii/1I4iqTzXZUx6MP/yq
	xMg+1Prj3CLuyELPa7WaA71tDl1G5PbTb93c+yS2lj+Qwxd8B3/59LWM1ebn+6/ftgjgr
X-Gm-Gg: AZFdTZfUvl/XYTePw6oAEMQNlM6/GEvgVx/ufdwwyF6d6rZJ64dMamgV2qbaSDI+9WO
	VUb+abbcK9bvcSbbQ86Jo3VuSlJ6V3agdrTC2m+2ES2SqjWCBbwV3Daca/nc5SKj/a9oKndG9i0
	87gfM3AX6OkuR25wdL4aTadPDzvd02SzA7wDBSOSnGlFha/IgvnAWizviB4IRXR52er3d28UgoK
	og4l77s5FBP17KivMoelOQsvpyXMdBWueqZGAFJgtWxhEnH+bajdz065LxSeKeudUuwuXoYpRmb
	zqsHHnXB7ogubkETQ2vMJzZ/eetNP+dorWlvM5mTpmwpzqrm1IIHK7OooSL7eWXnh0pE1v4PMBn
	/6cEWEDAozYAxmNFvwcOK//aQ3xwP2Lo44prytb1bfQ1HC3fvkQy/Z3d1GSUZGbzuVXeonlJsEs
	uZAJA77GCkbAzQtyxy+ggrxik=
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331254eec.1.1795687943987;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr19331226eec.1.1795687943439;
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm51643252eec.25.2026.11.26.02.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:12:23 -0800 (PST)
Date: Thu, 26 Nov 2026 02:12:21 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v5 11/11] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
Message-ID: <awgGBW9-cxJRlA_b@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <20261123104727.1539149-12-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: sTRhcG-pcPh4IUPWQACDTjqE3az_jKSd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX6q+NINgq2Zxg
 yTlo3nBeZpHtOc1oGtJnL1Q2zw6VvpjfTOu+6bIoR2wnqD+25xxuar+asUPr6tgAHV8XRoKI6Jj
 GfSD2uTkgm8BWHQjT7cUo/hwbc4lbek=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOSBTYWx0ZWRfX7zrebnvFgv50
 +WMUBFpp3t/CVBxvzQHOTQmuoDWGzy8AX7JpazdP90McMk26aRLjS+mfvBiifaES9M8z0zIytbg
 OPsFbmLyz3rcjLUOB3Eq4+A2Kf5DzmtZi+tHpJhGHOcD7P76CNaox2b2O10EUHT/HGodCzBaKAO
 lRQ59CUO7yBElB2IM8q4Bvpa27gc+deCa4DWdlwouaiudPk4ONhX7M2sViPEjgu6MuApGKXZH1q
 NiykNuB68mHhKoZkiHCBz/otYDs7yVLq9Vj3XS/9tndvMhTjSuE9vZ2dYWmYRytfN1/F6WzPx6h
 7DDzxEXH/Kv4o9nI2U0s5B6Wp7t12EWLzJjhJ4rw8+3buLLMIGUtG3aj+trgJOcM81d1lTnj3SB
 jaOcBftJMHken5sN67SeXA8GWb1GEh+lc+67/cu7BEEbNjPgCdpLKwV7p9Q2Z/gayg6tqqZ56Sf
 wrz0O7oJeyZWIx57LeQ==
X-Proofpoint-ORIG-GUID: sTRhcG-pcPh4IUPWQACDTjqE3az_jKSd
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080608 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y33D9nhtfLLIXgUvc_UA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260039

On 26-11-23 16:17:26, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override once at probe, after the initial role has been
> determined, whenever that role is USB_ROLE_DEVICE. This also covers the
> dr_mode = "peripheral" case, which previously programmed the override on
> its own.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 559de5172e61..22b6c7ca0297 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -964,7 +964,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		qcom->current_role = USB_ROLE_HOST;
>  	} else if (qcom->mode == USB_DR_MODE_PERIPHERAL) {
>  		qcom->current_role = USB_ROLE_DEVICE;
> -		dwc3_qcom_vbus_override_enable(qcom, true);
>  	} else {
>  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
>  		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> @@ -973,6 +972,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  			qcom->current_role = USB_ROLE_DEVICE;
>  	}
>  
> +	/* Force the VBUS valid indication to the PHYs in device mode */
> +	if (qcom->current_role == USB_ROLE_DEVICE)
> +		dwc3_qcom_vbus_override_enable(qcom, true);
> +
>  	qcom->dwc.glue_ops = &dwc3_qcom_glue_ops;
>  
>  	qcom->dwc.dev = dev;
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen

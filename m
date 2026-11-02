Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601381;
	b=uhU+ATSf7VSltl5qz+uNHSPXqAh+LwsteqV/FEakgXRBKUBihW8CNJQ1j/n8tDpAlkGe
	 ov4KNYgh4zEFEghHbLQNMSLZYfTVrPjdxSh2pCU87JZgB0IRWF+9HjJbF5yhsTrSc+02+
	 Rs01NJ+JrRGzimq+gquM+HbqIR3VNPcmrTVPzJufHd9WK8mxR9zrzsITJdY3TkalRycDX
	 P5e3baxyOL29uoSWyN4+suUpJu9AfonRGJglu33/FG3l53puV3aQCJl/7YOML+TAtjL4G
	 9rXbFHmHhBLCM+b5w1ofXcFqv97GlnyWHJvu+Wb97FutTbS3nrWVmq5bAAM5JDNtqhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
	b=S0/dahCE5rxczvXlBWcAWTCj3mX4qaj+VP3cPWcbrTtio8bSZwpOWMJ+guclSJPHlE35
	 cwyjFvgPxF3sNpCx+HubVm7DHXrRyjV/8yoLv8hAc8OF9F3A7NRYk6CwRDIm3gBavGHXV
	 suH0fZsf/1oU+/8wE3ZhSjp7zJR2Cry9oQDaeJfRESerkhyMeUEKbeklbT6QzUhT17/bz
	 6K+hxY7Ps9d8nTHC1zYicBWgg5Wl3ufS/9Tl2htt8L8m9Pzx327WAq7gEvKtpzDeePJxn
	 3GFAcE88wm8pv0KlLvzDm/KjCO7FEWVAy+f/bx4315esEutPchNxpMvsQKWLR9sPgYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWkMDN19;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STC+iUm2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE87606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 06:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE87606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWkMDN19;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STC+iUm2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vRrA2745964
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 06:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FNgNqTqkeVY9ayKVbUhSJOCw
	h1lLbqAoM2n3eAI1HTU=; b=IWkMDN19kV++YBbZMUAhz+I1I/lDK3Z6w43RDED0
	nDnD4Kk0JLUisYhJ78wK41jYqE1IC98hzX0uoDfGkx2kRg/sgqWi6X/v7w60Erzu
	ZPGWzVcOFMdCOWKWU2B6nwqarnBVjDHvQgWcOhGsSYw2kWPopPIkLIPwkrhb4ZEY
	dfzd0tSI/u/xFhMT+JXGy3wO+p15t3mk00WeN9L9/ohrkMVk7vJqmzVhw4Atw7rE
	JCF42hzSWIt0Zg/8g2Rhj3zdnIXhTuTHVhr0Q3lpRl5hhHGlAphW6zn3R+Ja5wEH
	QnnLE3QDAnbhV9fGwp4bmCUIko70yP5J4cKx+oi4/gII5g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dudf94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:36:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35cbea41088so3880221eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601378; x=1794206178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
        b=STC+iUm25DRhs+RRCDCJ5xvKil/a3zzIAL1KQXQaHkDWtkLGJmfOVj1frgNc3kvEer
         a72kRq4o3wmKZpFjNibzlRSzIoq8+DEs9jBekjkDSnFLqa2g7f+lkBVhOJ/Nf4vgtBCW
         /eDo0pbHMAXSlGVgo2L7ftzIOwipdWp7KnSSbVB3UHy9aZU+4NaIpYVokh07bozWQp5W
         9/5MoGm4YTe9sERprvWlt8XqXvADTalGdw0rCIg6WXlxQpyFE0cHktYH5DBkEAynsLLf
         E+eIymz2PigViU6S3YhN4BMXBMHmvlPzZlKayqsiex1xM9vByVZ46G0hJM1KBVFlvhpe
         UWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601378; x=1794206178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
        b=zbEtQ7gU6C+g0NNNN8oS5b2OoyAvC4r0729xDRT9VljS0ycVzH7DThf9oqZIPpbNiJ
         ou8+9sKAwUcKPg0WKe+4150PvVIwhEN8LxQw21PmGpDZ8T9MeiOWrwQydL9cOpV8V+i3
         S0GzpjSsNoMBQ+g0cC9Fwptdzx7diJNIbJ/jd0eRyz3dX8PBT1/bs6O32iH+3Q0Z/ymh
         YDB2jKy+iFT2uCC06X8/nwuUK2KVUqSQPdmFi7ZhKd/IOhrXIlCt+bhlmMwGlKnL/I+3
         ZiKkSBOm4zYkUThdppu5PtqDyEfevjauJK52/1fufM18q8vEhew7Wfw2egK6mAntVmok
         oaOA==
X-Forwarded-Encrypted: i=1; AKwUvBzaLCex6LMngnHKrdr4cQMfwdBx0omgq4Wph/R/z5Lx0hvjYBGfnRsSlD3s4yGyG3AE56OIO+LS/JIU7YiR@vger.kernel.org
X-Gm-Message-State: AFq9FYLW+o59jqal6CGTlwJjs8M1vF+qbNSP8dpPS0UskHqcovrXOuGQ
	rEMqUJSFZuAmDj8Z4eie1/jiSYHZ+YOWE7TiKPx76gTLLGvKfC+YxoOPUxHPAk4t3Fi2N4V01oy
	Quq9L86xWN98HF3t4k6Xn+nMeWG8jt9jUIzFh+dWMJ2eMadh5wLSiqu7VXTxTZWoOhYxV
X-Gm-Gg: AYBFou0jOPml7hVMYRw0qPIIV2ZLfQrQMn1CPMPOYF5N0qfWK3mBIlESqedLKU1If9M
	UOOK/OgPmFtVOnck0p1TElnW74e6v4oEguBvR9aPpfM01GO45U4bpRM3ZNsnlRYlND3Z8+HLLas
	2EBz68l3e+BJJvwUBBxYVfXoEGTp40ZPjvJNwKW1tTZ8yH5HkJu/vBd2Y+MXVlX37kANqMHPKTm
	kTyKwPmpxqf+JwGh5gZlfnl94Q+UrA2oQSPAEhb/Zqsmnv38A6BpxKscaaye8klmIAhxG1pdbbO
	nlS7gpYi3lfDmP4YYKIDfVb3IsP7tyquuDFmVjsVK+5pQyx0k4kWW9rIonSBmg2KxZB0pvmP5eH
	xxtrOPAx0Nk+T6lqdHUoA7pqqdPeVJjCnahBowZLiBMSaQf7I/lZLFOXWhGGdEl1SdwUbNqKmmv
	6SvjqtmPZxDlUBSEGvwhv7
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr13280576eec.24.1793601378268;
        Sun, 01 Nov 2026 22:36:18 -0800 (PST)
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr13280533eec.24.1793601377560;
        Sun, 01 Nov 2026 22:36:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm35915433eec.7.2026.11.01.22.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:36:17 -0800 (PST)
Date: Sun, 1 Nov 2026 22:36:15 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
Message-ID: <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae82f63 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=uiTGAi7-L7myVgi5AJsA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: RLRL-rVt-XVgqxDCaeaPkgiU7WfwtDA3
X-Proofpoint-GUID: RLRL-rVt-XVgqxDCaeaPkgiU7WfwtDA3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfXxe95cPBWvpFh
 NCjqPXVVAnDRhGtmTpSQRW7brqNhxha/c6WyhA8THcDYihaPIvLKdFyNjOgGlM8egLLZ+UqhWjb
 sFsLYUexXE8NBmXPBTxgSHvioy3v/BD1QeElvUI0d/dTdOyVNO8g3tKqfSn2ShcFGXq9FdeOwCb
 vJfpopTJSPjWFO/YcvYxbTFFQhaCZpb1JxuQ2gfqzkW5aBQv2IW9Y4ywz1kUsLlioxHfKzNT7oZ
 ZNJKYrFMMqtzjDvzgSTk2Nc4m0zPBsfUZ04Mbp3yI4ZIPjJpFdansAk/vCcDJodWR27IlbWGSZe
 Ly3frC8ctKzRwlkBrNkf/z3bU0QOdbYiVjZAY1fafVSpm3+MQQS7hMJCTaw/WFMBA6bQS2wlkDq
 hgdUMH6XJwWlZAgufHZsMwgvnT4CrfGPvOIZ7YDtMNMJlJh7sUlhVCJPcFVBLVAv1ySE3vmAjUK
 J9pmSmcxl0ImuswfRWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX0hwu+fhWnL93
 jkOEiAlQHqZHJqhNzorbHfKAqtWxD5Dn7qtG7ztXBKgFUfi0LS4FPHdJYk4rXSNOqAJSdIafvm/
 JtSCDVaEl7WugsPGiWp/r0h10JK3eno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026

On 26-10-29 00:29:37, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override at probe whenever the initial role is
> USB_ROLE_DEVICE.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 0896a323bdda..92f1223f7b21 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		dwc3_qcom_vbus_override_enable(qcom, true);

....

>  	} else {
>  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
> -		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
>  			qcom->current_role = USB_ROLE_HOST;
> -		else
> +		} else {
>  			qcom->current_role = USB_ROLE_DEVICE;
> +			dwc3_qcom_vbus_override_enable(qcom, true);
> +		}

How about move it and above [....] under device role, let above code purely determine current_role:
	if (qcom->current_role == USB_ROLE_DEVICE)
		dwc3_qcom_vbus_override_enable(qcom, true);

Peter

-- 

Thanks,
Peter Chen

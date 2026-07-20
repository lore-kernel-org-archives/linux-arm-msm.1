Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F3047ECED
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784585983; cv=none; b=RSjm3DqLD3ScNSD9PpOjS3iyZtXMXi1K2n1h+SxnfIT8QuwDy4Jif26LAEGwQ98w8ROAVUIC2mV5QJfs+H4O7JIzUrgwBw/GJCpUjyj/919XNfEKjpauB5YhGBY0ByBcnI5p/Vri+WbFuSnTtTJfzkbyPzPdlOMhy1tOl8VXj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784585983; c=relaxed/simple;
	bh=bm7Z9TIfufzBOFaLpexxq6FROsH79ShJEvHWwLi1ONA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grhXQfy03D/Vf3J1GVpvx+fNBcaDYjfZTkFHTcbnjs9sNosp4xcr+TdoKD4WWvKLM8frt70/ppSB3HJrJnQEumDAKWQA728L3j/fmWAUCWG7QBRDNeZOkQtl+224nTFkly4p5CC8Ssbq662f/P4ESSQzMXpIIpQDSpIFUXZU6Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHoFPChd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqU0vaxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHoFPChd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqU0vaxm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTP5w447164
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OCWivWDLjQUU4XplDWC2MJ5V
	z3OXYDvt49Wj3ddVztE=; b=WHoFPChdKRgCA3qmZiF+uleQI/6r1ShbPRDjJZe6
	zt09Gfqdimuobpa4tPi1k+RCUNyANIZTtzMyPIzBhezxUw4f6G60JkNHNb/njKZi
	M8fUBWtzhWom6AwlupD1yM4TOaiMbujrcJ7LFBX87YEXZSqgdAg6g10KaPuCjM8V
	TvnXyf1Pf8GxZWJlM8BzAOQOCqGLKmTY8D/JuI4XFITIao2u9JDFn0y+Lf8BZ8/q
	N/7KIwGo0Vg2MyRDXz6BEkCPW0K9N6PmU1fWPzqUSbcEDKy1VSJXySCXiRuHg/wf
	/cRgD1QzZbSbzgyJ35PQM0Opqr84X5ePzAuoegj4KGSDDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5s4gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 22:19:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51e4ba1cfabso130727561cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 15:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784585978; x=1785190778; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OCWivWDLjQUU4XplDWC2MJ5Vz3OXYDvt49Wj3ddVztE=;
        b=QqU0vaxmWE4D+HUkThVg7i48ezZESVpashDLuZeoWC2KDh2mS6J8EBjaZrwBrKelUa
         U2kQMe/7MYWYEx+7oy3VLFmJgGbQHyDmwlGYKyX/UMZ/xsCZ/n53gntvXVVPHKpay14Q
         HUAdUNTUYiHEnWIBWq+Wa8a1eAFUwjbAMB54/iRaGk7LIPBKpOtrtbeQ2AZqz+ch5JQy
         gpSbVglKtl5nQjBYe7ZWGJjaDlFGpuWQkJJZjsSeZXjcUlyJvM/Rtga2quH7muNL1omX
         HLA4bRjDmSZ/2XyJaemiKhvCAWXee7GYkEJAr+Eiry3PkVArGpGa0flrkLnxrm+fWbHN
         RoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784585978; x=1785190778;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OCWivWDLjQUU4XplDWC2MJ5Vz3OXYDvt49Wj3ddVztE=;
        b=XDJQiRVeenmbouTDVZ8P2mL34F2zxYBSJrzbOzj6oKbGt0XQlQid6kFnq1IWijvCTj
         RBX/QrvOx3W+G9BJ0/go6alouM2aEN2k38EJ9Bn7m4jQZuTBWOX0ErSJhmJ4VToMiChJ
         USY13ZBJ36CskbdIsmwfI3zcT2DjT/JZJxosWxXQ5t+Lu88EBW7UEeL/wim0AlOlQ3Zu
         UxqOvTMwLwMyRdOY8F5XxuooWfPgVcZYVIsrZQIPqblJEUa5TDVPpout5ySCoD6w0Y69
         71h/E+aJ30t7w/Fh+tH5xOWV/TNPPidseKkK6lHMWfNFj9tjIE0S2nCWCRF52b2hm8Mj
         7cNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfEV4ou3nc78t6KTGfLNJtMNTMn3PmLXhhKAusutcK8GQDEBVImesgHCFHIsww6pgpjmPO/lDXnzFArDQk@vger.kernel.org
X-Gm-Message-State: AOJu0YzoDqg+TDNTKEkwXIVPox4a+8RzKhszGzNvF0zY0jWUT3Xyaknj
	9xgH+DrbX3b3GjNm+MIEU6BOXTukuMwQbxtb52s3TXfT9LzWBJjyqeEbDfLbOCVWT+rEOGE3DzY
	DcBBh4Sj5jBt4Rsj6n8XkZBdhZ5YtNZ93LbXRqb9L+Cgictv7xw4PPCZZB90jr49FV9IV
X-Gm-Gg: AfdE7clSEKzx+dDNF8cidg3su3x9Sd9ZPJUgO2HZC98j93HEfQ0VBavGP286cg5gEFy
	TY9TD/jBzB+/7z075Hab5Q86T/XnMxaLNx36GwLzUr7pqLOH4W5bXGVhAHth+MlkkujCo2T3zaU
	q8aK6pIHcSZ6zkq5i/swKYkWt6CAL9kJerzQfUsZ0fGHYE4Q3g7VZ9y1DiIFlmuXjE3wtJcHb2E
	pxTIfwc3QSPyHgC3zwqJoc+oOTzzQV6HyIPEnl9/FuMIENG4YDUI5NBjDNPQFd9DEtqqs/ZmCGe
	/YYSp+sUwDzzgImpY9iLkJh7zqrxYoANvsRtskYNaFDErpwSzhN8T1ORnmpPPD14MegfFQuSEqg
	lxa1ijIhiziHmmH3HUCRclpM6qLKhzzIUIhr+XUPHjzOpT4ETNy4vi73jXZ5zX/oKrJ/1IEtHfu
	jvfO5KOTiU7RWTRg==
X-Received: by 2002:ac8:7c42:0:b0:51b:ecbb:206f with SMTP id d75a77b69052e-5213c205893mr142515651cf.32.1784585978331;
        Mon, 20 Jul 2026 15:19:38 -0700 (PDT)
X-Received: by 2002:ac8:7c42:0:b0:51b:ecbb:206f with SMTP id d75a77b69052e-5213c205893mr142515321cf.32.1784585977831;
        Mon, 20 Jul 2026 15:19:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291daea0asm2540232e87.34.2026.07.20.15.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 15:19:36 -0700 (PDT)
Date: Tue, 21 Jul 2026 01:19:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Anurag Pateriya <apateriy@qti.qualcomm.com>
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
Message-ID: <5houmyc3fu3grxqajn6ivucct25yz34p66lwha3icmcuj2fb7f@ypz3r3mqwzwe>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
 <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-shikra-dt-m1-v7-10-7dc99100c6dd@oss.qualcomm.com>
X-Proofpoint-GUID: DSlxm_xQQp2cir0IHDR86cn3iaoCE4tT
X-Proofpoint-ORIG-GUID: DSlxm_xQQp2cir0IHDR86cn3iaoCE4tT
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5e9efb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=s9XTQAQIpqgTDh4RU28A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDI0MiBTYWx0ZWRfX6v9f1oCedl7B
 W2xdV/u4DSyT74JgbY/MQ/oMIk87Ju+S7f1uPKKoCrfo2/3tueykYQtQOdAv6Q0jyOzOCn5fX2S
 4LvbOSx0cbTPUjaYP2rrN3Nva+dP1C8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDI0MiBTYWx0ZWRfX2HKuAvOiKYMM
 0KcVGs9r5Uo6zYCBCcv2tOCteGpfeesTmBIXOLnXAi+XyFqqN1+TSBk2IvjE+z3wvVbEy9hBFm5
 p9wl4lQHkhv3ztQ52+BaGnY+xGW/HP7s168FwdByl51yKjvGW13EHEvzeOYaK8X14HdRidrSLBU
 uaGexWcOfYd9rEVEgjzlrGexK74AU95SOtZ5uG8t/Kw+qOokS1DPGL4EgRz/MmBt0Un5zqfgbOu
 qSyJLowk//bdFSzrKXmrYKEhwdO8OOX0Ga0Vwnuvb+Y70HcaRRgcgkw9lZatJ2xXaadRVxSH1B3
 PRrtv/3K3JfjLp+EQdwdgMVwUjsXFdimYCP3VufjxhS6YWE/c5qnCZHK4KPbbx9dUxe9FMhJc7t
 EZvyRVuWE1mQEPDYPmG5hRvtKHv4ooTAEpO43R9IyE9RarwjjqzO2ugU4g2zXnhnb5EsAorVNwg
 kulhTuvPk/qOfURSjfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200242

On Mon, Jul 20, 2026 at 04:19:26PM +0530, Komal Bajaj wrote:
> Add gpio-reserved-ranges property to the TLMM node for both Shikra
> SoM variants (CQM and IQS). These reserved GPIOs are inaccessible
> from the non-secure world and dedicated to fixed functions.
> 
> Signed-off-by: Anurag Pateriya <apateriy@qti.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Who is the author of the patch? Why does it have two SoBs? Should there
be a Co-developed-by?

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 6 ++++++
>  2 files changed, 12 insertions(+)

-- 
With best wishes
Dmitry

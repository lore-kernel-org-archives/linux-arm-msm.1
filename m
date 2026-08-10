Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9233D902E
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786365052; cv=none; b=ZpcO4Fewsa0WEjfA9yz9FnDtH+dwK3Ud4I60k8TuFdW4DQKZtuKSl+1MgHZRzF4pxittdciSFoxkPnls3MB2GjJwKcA1tejJyhdrMwIJunQ5Yn8vNebeN4vSfSpB/YYXQKtdY/Eoe9qr56wr9ybhpNphZ4+LeRYYrJPtB0RWwjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786365052; c=relaxed/simple;
	bh=+T9fxPcqvt5uF82iwF6LbyuG9R0cQmokReqYZr6ZFwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgAptbVjQH5AV+LvQJEnjQItRWSjaDe7RJ5wrTZdnPcBSB8YOFyqctl1VfAPtwriNfHXA5ZiANcLuy3XhQbV553RUi+c9TiBstwZTkG7aVY4UWj/luhug4GWfSsi3fkG3RynOXRNJJotUCwfLhEpb5c0btqMrr5tzDegIpoMLvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZIO1c7O0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNwqz2gI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIO1c7O0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNwqz2gI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SKcp2341876
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6990+4gLoIgUrP2vyV7AlLSF
	3GtnpXF45SUirxMl9R0=; b=ZIO1c7O0BUTRrLkenVpYq8AGs9/bPw2D9OPwjEsX
	DGdz2atar3rWLA20KzP4klCYO6Nc376U7KF4pqkDQKMjd7XVbjhFLyS4KPze05qr
	S0IMQegCpxrqc5+wgne5iGe2sQeJ6Gz5jVRADqwje8kb1nXIeHt6qmuFbgAaAmOW
	pmOzx/cF0cxV7eY1Y5VqupOeAqA6Hor6Q3Dz97AAkxYRJgi+8tjeiS3yVY26tqCT
	Zcn4X3zgsybUF6/O9cUJ4OWud84uVVMUnM5+mzjw+WGZ8zQgwV0ROsUYpurIfaZ0
	+J/gB0B5eay8QL/oet0I0O1Hm2wfAhUtRg7CJGoZFrsYrw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy19kjgk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 12:30:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso31987901cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 05:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786365035; x=1786969835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6990+4gLoIgUrP2vyV7AlLSF3GtnpXF45SUirxMl9R0=;
        b=YNwqz2gIUOKxTzqX3QaQ6CrYohLaI2L7/+Tr/qV0YbQnJm9VCFHavwHvTc9UStbJZS
         t8WCwPT+Wzsoc3oMqjNYSUbFbKIansZw3OM4edX7auFali/yZShRq3vnjY70bUGpj/hi
         2CEq0e5z5t79fg4I8xCd2Ky0Hf56kePGOwpD/4uf6KFjcEwv1mB9hPQdlckrGSxAZ7Ej
         sw5mmSgHVqPhadueVBsr7X6lYMdheMvGRSss51C+VuVSMCJAVTi0dVIdf3et2k1Ag9YI
         ode6uQvAW/GsLZm8dntDlyhopcnCjb01wY5eWoAvdRdUfKZKnFkHU1ylj/KRUerFQhB6
         IAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786365035; x=1786969835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6990+4gLoIgUrP2vyV7AlLSF3GtnpXF45SUirxMl9R0=;
        b=GNAAidTLh3OZcrsoXL1eBQG7cXM1SVCrmFJR94PKM/uSdCTiYtr81agzQl8dAJNBCm
         0i1W2TeMGMEptzKocyc/mhCv5HraRUrfgF2fp4QsPbQMH10/girpX/Z2Kye+euZdnPaK
         g/rhOxlyzyCBTHVItjBVHpyK+0EWjE49Quzz4Vmu+C5lrEa3QH9YVvofCa5B256s9YLP
         aHCO74nUXraTrifHFM5C+7ww+mZ7/TojIq0/CyGcfMDnmF8sBmPyzKa1LeTqgfCZYz+r
         R9noS78SOOhuCYS9jyZ2wW6igqym1Adlnm3fzoctW7y0agGj4m6gYRcsWaPx2UwHPe3U
         Qpbg==
X-Forwarded-Encrypted: i=1; AHgh+RoIraHQLQYsZekMo4RwKo+r5aPqBVR5VuiC/x4wZHGXuF9NDuQ0Zfi5ATkCM1Jfyb+7qrOWWr8kvWU6cPzu@vger.kernel.org
X-Gm-Message-State: AOJu0YyomADDizVOq06IKTO64R5eidtonopwHHpfNIJCMFRfY6XDzE6l
	eRCsumhresMNfClx+swNXgQG+7j94D/c9wlofKHHufihvv2QZcpuhaWoOEyuAGJu6YSjeNNBdec
	YEnITvP0XsyNXZfux2QoBL2HUI6RnC4hZ07EIdsnlDlvlA2gUy1I1UL8m9o8PWs8J81Qo
X-Gm-Gg: AR+sD11j8oxvoKgQYspCTJZRMqFJ7nsmlC4iWVArOwkXnsInJ7LPXQsQZDMmhPKsnEW
	VpUaeV9glG1YLlX1vOVSJGpG782wNGjNrS5+OFuZSfTtAOmrsCckoqpFoH+XtCBQGreVBkRI2r4
	8ye0DqUjeUrsKYQztL83h15uV6RXukbZ00YrQELyHsso4SC1g/dfD0Irfahvjs54yVXHc5u8wbQ
	zLveN402ZKLX7P28H3yFthz5FIpbHkvszIcRdKa4Pd0KcjH9hJ178W2O8kYC6E4B/ygbNH9kCOr
	b0sEQKUvJ1OtERuVxtyt86Spzlxs2miOvTrRl5VBm2tk2b77y9Gi6gtkZazUfc+koNTfMkRAt4A
	+MrtW5bqNywQ=
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr340763921cf.24.1786365035222;
        Mon, 10 Aug 2026 05:30:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2448:b0:51c:1117:c79 with SMTP id d75a77b69052e-52d0b193284mr340762601cf.24.1786365034749;
        Mon, 10 Aug 2026 05:30:34 -0700 (PDT)
Received: from oss.qualcomm.com ([82.77.85.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea2e038sm288451685e9.14.2026.08.10.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 05:30:33 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:30:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add Graphics clock controller support on
 Qualcomm Maili SoC
Message-ID: <qnkn3p3bcwou5endlvuqr63m2dvhzlt4iocbulnulrdjol2u4b@p72dfaawclxy>
References: <20260801-maili_gpucc-v1-0-9d8c37bded69@oss.qualcomm.com>
 <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-maili_gpucc-v1-2-9d8c37bded69@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HuxusoLwvcbBjtGOjDpRTQ3k4MQ_3pUU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfX+mxwpLIrMnYa
 Z6m5tjr4SqL18zhnO1/UiwZv1tEGZW69hlMOOSYtYPOkETtI7Bm2LR3sXsshUJRGLVC/RrXuSvI
 CBTj/JrXoe1xcwRhp+kJ8OyyZVS2ovsIL997KTnOAHKulJMtIkfSqqhgNLnCtNkdOzOgucMN30i
 x+lLX6j2YTgQ+J8tWoP36jwXAa3CE027yw2GTGZN8cQ78/hJDa9ZQsnXta6jaTkVqu9VoDnO3Ta
 fKVFxO3sxPdLJdu8c1rt0gOloUZu1HY4K0ivyK4qgmhk1MoFUWckPQYoduk1C6Mrs2VYIB51ivL
 nHV0uM4JDRG9D5eSSL3gYmLKUVeYw8gitGYZ5C6Ubirq2Amwwj7pROUlXNWlT5NTKTu94i6H0WC
 HF0d0/vRf8VDSRH2b2UmxkxUie2R7VKR1QBt+eKZi3V5sDJ6ixAs0VaJaMcUJ36Kbh857D0v133
 WA1rmylC6F5l25PmLGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEwNyBTYWx0ZWRfXyGfvIeYKB6+V
 /RyIbgDe3mRltskQDWtRbStGgO7yHW1g5fwlorEyBAwqPbsftE1dXSGJgjTR4/CHoU9rjBBnvrR
 kG3laU7FFMGXweur37FcFr3A8RDxE/8=
X-Proofpoint-GUID: HuxusoLwvcbBjtGOjDpRTQ3k4MQ_3pUU
X-Authority-Analysis: v=2.4 cv=abxRWxot c=1 sm=1 tr=0 ts=6a79c46c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=GMu+mMXmPKlJm/I3Pt7gOg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fCNx6FN-KcjCUQZW59UA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100107

On 26-08-01 00:42:46, Jagadeesh Kona wrote:
> Maili gpucc is a derivative of Hawi gpucc with pll0 configuration change.
> Hence, reuse the Hawi graphics clock controller and extend it for Qualcomm
> Maili SoC.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

This looks neat. So:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

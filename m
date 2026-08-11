Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AF8278161
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453145; cv=none; b=eSByearurEoZKwImIenZBh8nBL7BFlIvogUTViBwbasjIQvzTaohcit7+pm6FnbW9c2RVgP3glF0tkMLEVY17n8PQkQ7UeaSz2gBVajUbb2QyLmkJ+xbn80TMaBghEf7L+nAfq7YqZnuShVkRSQjVaGYYsiOm0LJSzp6Bds2PwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453145; c=relaxed/simple;
	bh=XKKJd3c9rLa3MO7JUMHEIuKamL4nzttlvV7UC1Dbh1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T57MAV4jRZm1F72x96l7srGBYdZPvM11mqifkTYwFvGS6XGnF4wQVjlYC+1D0IwZuS+XLew7vd1bGpsc3NL8YsPM4s7ToXv+5E0jP/0ICVOW+Jl7iGBggjdunayoUmmDLlZ4/nueFvKx3TRmzNMmcEXKoO6XsR8438UzL03SfWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iU1EN3xo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIJ8VrB3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iU1EN3xo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIJ8VrB3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCR4eP1168877
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d1LOAVLaXvcUVOUS5kxm+cqp
	igoXQ1JOPQ7twMHVr0Y=; b=iU1EN3xoWsCdt5slHS/V8ooTbEcxkSr3mbxofmAS
	NOwPQDBANNlr/mYmBkoIn5nRrishL4kq83uU/vxzZINFCCPNe6eH3htTynhPg2Am
	1qvrkYFXeJpvJlUD2/YqUgwdt7ucTrZh/E0fG2VV1tZp4DNWPGbpiNCLc22ynyEV
	pkwr/1fm0Nn+6PU9sqFJiZQ6MdpF3ydnwAkdRFRfyRlQbEibqOi07weCUSaDmJ0M
	reIGhEuI6Aqm96BDU4E6jhlwdQLtuL3OX10AryGlihqifDzsqY3Huou4NhGJmkvU
	Ym0kXEkLtA8xqUj7ffK9hHeFgS+nZoC5o9MFYhjJIIA9Rw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk2s8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:59:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so8231941cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786453141; x=1787057941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1LOAVLaXvcUVOUS5kxm+cqpigoXQ1JOPQ7twMHVr0Y=;
        b=kIJ8VrB3JB9vmEW/eT1NLAGX7CSPgiomuyMDwSkqHzWgAEZ56NZdWPFqloCFak//02
         2y6+reorHspHIKBO6UpUOm4SZ36Mo4IxKO4gUD3yDbCYMk06FkWjdKjc8d7n7mxTIeXD
         MhAKb104zLsdAK+jcDo0amz6pt+cDX5inakXv3XJV4x6FbDMb6PW4SAZcpu1Ca33cb+m
         +3sSfIim5bIkcNA0n1+PzwqtROPA0rKGrZSR/0Wsj4ird1o8HedfptiP2ZGijXs6SCkI
         vKRAwBJA1YaKbSdnKWXW+junKk018Ms9GdpNAt0OAQOLlXBkhOXWDOj2BaLKJShuF2xV
         0mNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453141; x=1787057941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1LOAVLaXvcUVOUS5kxm+cqpigoXQ1JOPQ7twMHVr0Y=;
        b=LUAALnObqyHSCjqKM8GKOMxSduLaDbSuauc1DJ+O+dIAKjjuYIJXZK/TXbjZFP/pho
         Be5wYOrba12+8IUUlbL7PxmnWRcrk70UOCLPl9H6k9puUAONLlqhdJJMnZTIzjXo5ZVQ
         wBT4qj+fHioiG7cU8wUYBoZSYposow5pbumWJTXkxDWY4ywvK8Gr4Hvzn6yRnKuFMuJ0
         oKsS1eQuAt+emy40D9iYbmwsVmHmf1Cx+H4YJPWQnXK6hSB2LA2cJ0NDVUcDk9MBnm99
         S9yWOVqx1EY4y8v3jOvFRSSBfxsMEdcD3T6aGQy446b1+vBtj0eMtIyBKmghtzkDD0Eo
         OKrw==
X-Forwarded-Encrypted: i=1; AHgh+RpjP/1fVzwGJTKo9fTMq8faMGXmP2L6aLRv66xrPKXPbcJ7NyyahjVplowZqXHfgd9ycVoK0KZ2Ecv7+u9+@vger.kernel.org
X-Gm-Message-State: AOJu0YwCoek1ge4CWMnlJXYvj0cDJPfGIjLQ3T0botCVBLxa/9zTIh8j
	gC/2Ip0siLfM4yfT2zYtiLBMhWMqvmPFWp7w0h1kMubz9y9zRcm7k9QOEqa/9/J6K182URL2ouR
	0ffbrolH32gSSqPvBbVzEgB5WrNW2r7ZU6rxU9qupnS0weB/Znc9Q4/xF3mwy5/gKwChU
X-Gm-Gg: AR+sD11hoK80tjg21j6QTcY7mcasniVygoKm5RyMP0lSItsLDM1UWd8AxAHibtw/pyC
	Y6/NsRAAEhHOnkMMDj3CH3eQ7iKrPQhnO4OFJpBwHsb8V+githCf/WqSRlesQs8P2KtS23yROeE
	GjC5FJefiaiwtJY0aCLYzfAnl5UjpKkBC13tuKM4Q4xVt/KXt16WM3wuGCbPforppYmxPkymPKt
	ydcesgbMtxYScuTWXIsMQwTe8FlPi0N43rbUcyiDXk/vYpvMhPkROsWb0vr2OWJOtX/1u5nzhKh
	cLVD8THx+k5Gx7kDgu1FWbc/96UazO6es6ihK4M5qYoY/M16r7o89FLSkp4G5jrDNgKRbfMuIsr
	5oyurZEN9eoaDtv3C9JEAtqB7Yl03k/Tji+zerzczRCUxBALnE0DVgiTkIc8RM8rlvXncflxcEH
	LC2xDB18pQOUbbnA==
X-Received: by 2002:a05:622a:491:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52d600e6aa5mr54211cf.12.1786453141386;
        Tue, 11 Aug 2026 05:59:01 -0700 (PDT)
X-Received: by 2002:a05:622a:491:b0:51c:1e69:bcc9 with SMTP id d75a77b69052e-52d600e6aa5mr53781cf.12.1786453140902;
        Tue, 11 Aug 2026 05:59:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fbc84sm2423781fa.14.2026.08.11.05.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:58:59 -0700 (PDT)
Date: Tue, 11 Aug 2026 15:58:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jia Yang <jia.yang@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Clark Williams <clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, jie.gan@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH 2/2] mailbox: qcom-cpucp: handle NULL data in send_data
 callback
Message-ID: <gkju5hkg2r6nveirwe3bzeu6onezx5wxnkd6rxgn4lsp3uox2k@dn3crxwncft2>
References: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-0-d302a63dfb5e@oss.qualcomm.com>
 <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-2-d302a63dfb5e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-mailbox-qcom-cpucp-preempt-rt-fix-v1-2-d302a63dfb5e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfXzExSWPgBZPEF
 UiYOWeDkVjcsp8fUf1aFyNbaxcH8yBM22+4gKM79W7i4Sak7Ltb+ZfIndhAlof/qK6NoaCWdSul
 IwVN7iAUnGyvZS5HXojY3W9+pcf79n7Dedz8g4Be6IXxAimunImBW4YepnGseGYh1/VApJbpALA
 +eH6lACMYC/Mg8B8lt11UK/5bxyenFbxSI6ZhTpHdo654qwANE7bZrVl6tgFKZhxtjkU1Wu5Kt/
 TkpEj7qpd22eY1JiPqxkhjMeZ+SXXIQwE2GLqDU1XCySWuapekpvpS/5sOHXRdb7C4YFvw8wqVD
 MfYlIOq9bLfsAVyIlfOf5q8Nbe8kevQetNaiPVcoMNppvSFxMU/O/nR3XLGYBptYG3vj13DvodN
 P7ty5ZZj50VUDWdeRz6FXCEo3MuNAoYt+8lJUFp/zz5l1RxhR/ukRR6LRT9RPB5RlVHIkt80Mdp
 JwMfrnu5UqJeFSy3rDg==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7b1c96 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=TFpumMFFombz6g0OY4wA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfX67yETIgiC8og
 wwn+V64Z+6LvXFbNbtvXAiz26GiXN1RMZIMnOfyzRFEBrWVfoRgGfRs7aGi5BUGCIBB3/XwfjnI
 zNs5LOJt7c0mIPecs0/WKbLaNScz82g=
X-Proofpoint-GUID: Vn6In4OcnkQf7d-LXu3M0342KEXyXFMn
X-Proofpoint-ORIG-GUID: Vn6In4OcnkQf7d-LXu3M0342KEXyXFMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110108

On Thu, Aug 06, 2026 at 03:03:57PM +0800, Jia Yang wrote:
> mailbox_clear_channel() calls mbox_send_message() with NULL data to
> notify the remote side that the RX channel has been cleared.
> qcom_cpucp_mbox_send_data() blindly dereferenced the data pointer,
> causing a NULL pointer dereference kernel panic when invoked from
> this path under PREEMPT_RT.
> 
> Add an explicit NULL check and return early without writing to the
> TX register, which is the correct behaviour for a channel-clear
> notification.
> 
> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> Signed-off-by: Jia Yang <jia.yang@oss.qualcomm.com>
> ---
>  drivers/mailbox/qcom-cpucp-mbox.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

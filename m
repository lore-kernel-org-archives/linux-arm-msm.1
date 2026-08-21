Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911B38AC7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787309575; cv=none; b=CIpDWOrdLaOZZ6dfyrDmZDwZ9+jkGFLjZGJkMv6FeDm07rmj+rh1ED1BA8TjzsRGLLZW7uIJyRP+H2om5VjEz8eYg2CrWPtLVnK58ICx/Xct1pB5roM8apncTGcDH+FhR6I5I06az5pT1QHHf2bLYu7pSo2PIC7oXCGj+RYFJS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787309575; c=relaxed/simple;
	bh=wHykAF+Fcx5AAZCtROJj4e+qMyAZO13kGrd6uhFnJwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8NcZ6KRGsM0JbvAU22b9m37OSCLJLaZI53m05OzOrVDx0/nMjO2nWdxuunVobZg4stjL4226LlMYCaTMUWCcPjRHdsJP3/xLRzGZJlqMccJeeDXfFHWEWpK4aXVujIzG5lOPEYVbBGckD6r9aeQn9pPizjfl0nGuRrxRX4Pv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hthVBLjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPf1j0Ry; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hthVBLjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPf1j0Ry"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9M3tG1799934
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y2oZfmd0XqCYaK1sXSHEKjq4
	RE7FTd9km0ymNC84mi0=; b=hthVBLjyQxCzcmChEENlK2lCKSmrRDeelYIOsIHt
	r3kydkwcSDm7PG7lwthy/4xdWumsi39zDSbCh9ahwH+PKxa3y3AQDfp2G2A6PfXg
	dnp6jRLRhN0cu/FhQUsper5QQP1w8BM6scHSiTaXlvZm11griD17xSdrsbkD1+8r
	8Fx275t+JTDEXBYtfYVvSUUgJDqz0bpYUFQTAdk6043XmkCuJMLYGgxmQY1r3w39
	zAMDC+y6BLmwJC7nBO2oiVklvSz6TQEODiWPc9GocizKfSHI00fuSLrdHZZ4sSks
	KUSWQPIyfeGQOTxA67hiwingE//m1AlSbQINXbVZov5VRg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecb9jt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:52:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d7886cdso16065861cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787309568; x=1787914368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2oZfmd0XqCYaK1sXSHEKjq4RE7FTd9km0ymNC84mi0=;
        b=SPf1j0RyCpkC9N8ZR8DAtC+Wt2vMwYzR5XecKZ+ka47P1+WXwIJkneYHLIp2+pP952
         Hk6ShX/thfOZOQMiFp1XueDZbw0/zO3rzhJI0W9W/h/4w++PRC0M8xfdem4GLtJ0DbWd
         xbPDbIFSaTmYLLGezFDEjg/JJSIo2KpO7R9VajcgrC3KY7piyaDUwjZWWD1Ld6+aOlqJ
         2tL+UqWoUVAZTtgybHWEwtdLTCvDKR3iO/a8UIh+SI70ki01P02GQiV/ejW12ThFnqiS
         sI6S8aMri1w4QaCGRnTwTcygMzPhkKT+xZXhs3Mq7pYIbHqCsXABxsARs5+cxImtaeoW
         7cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787309568; x=1787914368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2oZfmd0XqCYaK1sXSHEKjq4RE7FTd9km0ymNC84mi0=;
        b=AiMODdtaLkrSfUPPzsQ95y1+yklYiFoSQsS8lKD+d3B9kazY2vZy8naBVIzB4mfKkM
         XfbdsS1GmzQpu1AuRj7erpf/IEkdGiwBteI1yJi8FOqmHM4x4G1uCQwTSKBpPgNjnLxp
         DOlmUl8YRAQbzaypo/RxaS/oFKfTk+ca6U0xMgcHElUtzMSadwlKKLc9xM2FVGtnltzv
         iehbgK7EVBoNfv/Wp8MBoZjnrFtrkL8JixRe05olu8hznzbjkf/p81YPyVBBuqHGSAQ5
         Ecdl0LMy7+9hYScLPY7X4+VS4bjihz1K4w+8vBvU53mMpz9VNhgBUsQo6xG3ZrX2RcME
         BgjQ==
X-Gm-Message-State: AOJu0Yz9ZPF6RSodsTAln+0Ufzy2VlGx9QI78p9Hza8ES7CXYHFX6LwK
	s5bHt/ZBNh8A36w2vn9MaDnRbWY3oxdjeBfxi8Pmn6fx/Be9xeRtsKPRS7aX61es9Lw1PfqYXQF
	PFoJnJ+4YhHTwpO5KDwpwg/dPzubP8YgP/kY7CUJdoclIXFu5dwJJSAk0pL7Vf8OeX/dX
X-Gm-Gg: AR+sD10lvCaT/eT8mWf9oPDj45eRcAG+Cth+7XV7JAKAIEqTZfxmZuy0zyzHzwXP+Hj
	oo+FjOqZBiGeNrmDqCN84KEWRR1Hn/WlCym56gFxzPIBMexGVE8SF3Cc1EXEypwddHb48hkGnjW
	5GUPYlF1RiXVzVmnPSMo7k1jobSRJMlMpx3YyoS75rtnh5pwokxA7kCgeJdgAoPim5HVwOlbp11
	TwvveVtKEK/2McfStmIlkoE3rNsc+xtEuRlB4dUWVfscnrLIXae7BxAm9Ma7FPm0VjS+CwHTS58
	qVCCw0CQPGhkwKrYtX6oP0h/RWlTpqBSiOibV0Qkhnqg3YN9yh3oXRokp8igE+JeScucLFI2Y4X
	SAV9hLJM+y0cPeGhtAGC/qnwqr9+OW9IUIWHW32AWm1jGDsyFXODCLhhDsKE1sdFL2POl4u75k+
	38sxTCEixwKux0
X-Received: by 2002:a05:622a:17c5:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-52df5739b84mr47906431cf.17.1787309568127;
        Fri, 21 Aug 2026 03:52:48 -0700 (PDT)
X-Received: by 2002:a05:622a:17c5:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-52df5739b84mr47906211cf.17.1787309567708;
        Fri, 21 Aug 2026 03:52:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788dafd9sm1894294e87.51.2026.08.21.03.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:52:46 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:52:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Venkata Kota <venkata.kota@oss.qualcomm.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Subject: Re: NSP Images upstream for Nord Platform
Message-ID: <kug342o2og57tdhortgabobe4vdjn2jkv3bxoqzfei767neg27@46p2slgpyj3w>
References: <ca4efa2a-41c8-4658-b386-0bc691e95179@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca4efa2a-41c8-4658-b386-0bc691e95179@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX47by0FBKtjnV
 ZglZumvIm/+pjb4+Zl7QE5AImcnn4AZX5hrosXXo+dqH98deJ965O0lzlsgrl9HVSq0meS4Sz1E
 d4KveZUU55EYwYOxvOSmCEfmekunbESSDoyp5HhIBhIoTLzpG99e3xv5Wp4jV/KPhCgMn6bDb7m
 mrqsC6GkPHGFAy4s9Ou8wq1fydhLhmSVRmSiKUUWIxLBEcweCJQRTDsn9dWtoB5Ub4+Rp7al7uu
 3Bktdo/r24s8aqgt/YJvk+rx4rZuasSPwcPC9CPax6xqk6rubZ4h72138rdkIG7FqMq2UdTRdCL
 rvgRrfZtE/nZCq/1KIbvlA/Ve9IyBSy4oTMl5sKYJ1/C4Ad1i1DntcPHx0xR8HQakBTIUVxmVEH
 8QuhANxoDSbpDMZjUDqnAN8nQx44R6HVlkhSNsCbfFOWFcE446yTVlbUUmluYIZdXu+IeptkxbE
 7gpx0oesi4N8KDNeqDw==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a882e00 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=nLBuxvsX9MiwT8o7xfIA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: -y_0n9QW1hh490Xk8qO3GJq9s08aeFoV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4MSBTYWx0ZWRfX/ItfNhJuipYS
 0nIouFJfHlmhEPJQNWhLtF3eACAgiw2igcBccZNZu5Ebp+yZdhE7Bayi+oHqbCf8TReS4E24KU8
 WpadqSNmmWv5N7z6k2YqUuamDWVn8Y4=
X-Proofpoint-ORIG-GUID: -y_0n9QW1hh490Xk8qO3GJq9s08aeFoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210081

On Fri, Aug 21, 2026 at 03:50:14PM +0530, Venkata Kota wrote:
> We are currently planning to upstream the NSP firmware for the Nord
> platform. The platform contains four NSPs, and a single NSP firmware binary
> is built that can be used across all of them. However, the current SSL
> validation mechanism requires a unique SWID to authenticate firmware loading
> on each NSP. As a result, four copies of the same firmware image are
> generated during the build process, with each copy undergoing a signing step
> to embed the corresponding SWID information.
> 
> This approach is consistent with the methodology followed in the earlier
> Nord program where firmware was successfully delivered. The same reference
> image is used for both QLI and upstream releases.
> 
> We attempted to upstream all four NSP firmware images; however, the
> submission was rejected on the basis that the images are identical. While
> the underlying firmware content is the same, each image contains a distinct
> SWID and therefore does not represent a binary-identical copy. These
> uniquely signed images are required to ensure successful authentication and
> loading on their respective NSPs. This requirement arises from the current
> SSL authentication implementation governing firmware loading.
> 
> Several proposals have been discussed regarding potential enhancements to
> the SSL authentication process. The SSL team has evaluated these suggestions
> and is currently assessing available options. However, any viable solution
> would require significant design changes, along with the associated
> development effort and validation time.

Thanks for providing a good summary. The mdt_loader, the module used by
the DSP driver to load the firmware, already supports loading ELF
firmware split into multiple binary segments. While this (legacy) format
is considered obsolete, it gives a hint on how to support the Nord
platform, while keeping linux-firmware contents sane.

Please split the signature segment to a separate file having .bNN
extension (where NN is the segment index) and make sure that mdt_loader
can load it correctly, possibly extending the helper code. Use symbolic
links to share main firmware image, while keeping only signatures apart.

-- 
With best wishes
Dmitry

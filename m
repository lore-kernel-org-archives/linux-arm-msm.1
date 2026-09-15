Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A524756CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466079; cv=none; b=u2r4I2w1H6FlXyLTk1n9PKuhKyiCLgxlTxWwQsF+UhV7/XK9WfsYtFdfal/K7rGU2pCstXD8zXYfZcm+qdI2cpi0xZ2rRz8fsyVcjOzzX7ncWhlpJHukexfh5wUDu7lx+LTxINz/TrTGTjVOQN7bPrzcpzHnNgXDig41Ckzg/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466079; c=relaxed/simple;
	bh=idsPIr+3pZBF6LKIDN69cLPiBTmHyZ/pTqdI2C2CvLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roEKsKQO0fxkIcRuD6IPDkimU8U43XgM+ECPppV+ic3rpKbHzPi7OYbCt93egk9lTooVAmzCp8QEF08aZruhtxrmax04z2o/KO7jzrY4V5g8TZhyYoBIFloRHFq2FZSCc9iwJwrUS7dW9QDf5yh6AX3UVdu0adCSeQNmc71zKko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i/pTK/rN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byLCVtH4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/pTK/rN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byLCVtH4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h15N3415605
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vppERyoW3BzJo5xUE2KTfoeC
	I03u7SKMXvXaWdO/Dc8=; b=i/pTK/rNkVlprb8nKTDlV6gxmFNaNtgmLVmJYpSM
	S1vyExx26sU6ZYrpqIaNnfqZfNsINDWItyoe11Gqx/Quepqh/NQq57jvFLUSmZDS
	DNAvO2jNkTVuan4M6FK+4c46svWcyYDuOCm7TK35GyJR4Ss8BHqwvM0WjT6GOSvX
	fqME8uRniLPF2vxeEe+L5fnUES8mMIfBxqiwOTwrPLAraxgkQ8sbLXImtxlWLHmi
	rag4GVWE14u6n+mwpJqdTFf2f10FubOG3xGVhTDmGgqaeLwFoz+Rk0Lr2Z+J5p6b
	XxQW/tBKL2mRmmMOUYNgaG5/TkWMuJrA2VuCAieQibksQQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc030e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 09:54:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso491275485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466075; x=1790070875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vppERyoW3BzJo5xUE2KTfoeCI03u7SKMXvXaWdO/Dc8=;
        b=byLCVtH4uPo1UPFP+w01Q/AyyRUCn+8BOvdzwHIlAuWQ+TSnY1FHF8ayp5hhOBQJUT
         k0U1jFIN0mioiOJL+5vdctqGF7FilnM8MdfwvOvSX7vWDGw/9zLQX3tKaTieCQNybZ9c
         vTwc13bfKsTdRE/qvTM1PYFiQASfa5D/jVi/Xu071r5LbLnxb3EMhio6LmzNdb2o/E/G
         iPfpvqrLA2gBJHaFTlw2sLDwOfhi2ShOqS+PkyZW45lmFHiEYD5L/0h5uks07f1X3/QY
         fpQrRA+mzpG4wxguw7ZBJclk1I7mTObbayqMlR+UyXKBA+o0cYFYLVkqYdlrkafSO33q
         VE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466075; x=1790070875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vppERyoW3BzJo5xUE2KTfoeCI03u7SKMXvXaWdO/Dc8=;
        b=r8w3XdLhXXVfhB3MXvM5YLYcKo+8x13Zt7Mvw8tKTTXPSQ6EsyIRc8XhF4+bMwDECr
         yE07NYbKwWsT/Ow8nZHC4MTm10fKkRIhBIOXgmW8NDBXFYfx+Fee3a2ZhJUDY3XHsMNw
         +6XUzHHVh1WhTMPnkt+8enGQrYXFw25ppUqqyuyHlmWnS3I0LsFgv1Ba/SND0swcBjkg
         B+rk4Onln39ePdiI0i89CwnkKZLaDFQQTwvFu5vV1HE0rCATUqDNn0dYxW0hSG4RqKKC
         /FCUHi+dmHDNsbcdY9yoYnKb+rj/PkyIqyX3HMio/HnlGnTQaPD4YhF1YrxlwvmiIsEk
         NZbA==
X-Forwarded-Encrypted: i=1; AKwUvByIqIwTkLavKouWki9mAf+IBsH4ggMRgJPyq4ZpEkhHVmFs1Gf7LnpXmxHz48DqNlYPLMHysc6CUftT6e6I@vger.kernel.org
X-Gm-Message-State: AFuF++nu26JDNs9yi/aQBu0/NfvXJbgKx5TChL/TGA0CC6UYNNZ7GaFR
	c02HPkKXY4IBMNIUCX1V6LDoKBhZl+Ipy6mIKgVD0JCv7x9zxInMk+u9H6rFk7fz+Mw8JHuyXEL
	F053/i1TBFi6ASwU2DDtnSShGvpIUn+mYIQjhWIUkDki38P2YaJEloZkMS5Bzc7ZbfWd0BnFplF
	M0
X-Gm-Gg: AYBFou2jUxOqEAxqPKFxl8wNFubJdajnQGvuRnRga8Dyvk6RAuE51ZVlcZ3LbNVqLcu
	Ng6nKbDBlVTISpoN//zgCK6qMw116evbJ8r6oiMrvPuFKhVfTyNM0+yGVir4lqRifsrIIC8HEFl
	eBn6v4LGBg8xELKq+at3TuTfzYhpqd91TUhfFODvG/K84QTwWUbqu/HBnkDo8HTqdj0YQx/qMEF
	GO1IWhXln+2zRsh4zFPs5iHJqZEuVmSM2BHTpKd6dO1dIqeuQ/Uj97gMAdicW9NbEyKMrFlBYJc
	VfJGDfkDPXseM85OXC+Tt3xlb6ugH9oIZp1i8RQ0xnK2NBecr8camLFqDyRnmVOUpbyFKVOsYhK
	42W8rHL1Up29OzA4=
X-Received: by 2002:a05:620a:2b45:b0:939:6de7:8768 with SMTP id af79cd13be357-93a4087e8d1mr1748985a.47.1789466075293;
        Tue, 15 Sep 2026 02:54:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2b45:b0:939:6de7:8768 with SMTP id af79cd13be357-93a4087e8d1mr1746885a.47.1789466074829;
        Tue, 15 Sep 2026 02:54:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm34465272f8f.19.2026.09.15.02.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:54:33 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:54:32 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
Message-ID: <ffzuqd7jofwosprorxymtv2mrmvdoi3uif4yvgkhcus6m5vb5t@ahitqlqnb45o>
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y0OuNmTicQkjaKmbhI_n_FJGhmQYi8Wr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfXypApKybhpRlR
 +U0gIUpZxjGUAKb+ga+7mekicDw6vpukEdp8MlhRaZGBd2Fs+b7aw/LzyZe9t3vj4Wjg6uPE6xK
 VZDHidodVH4VeV5q8dZpuZRxxJkd4Co=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa915dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iWN5h_POgodqhNU-qcIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX17bRIu1L4uK+
 DU9z7+7t4rXEQlSw3y3RAndILpouV7ykW3F8klHQ/ca9UViQDul+oamHmSixU/+pfHPgtE/ASUx
 UzKSN3wnrJPGbbAMq5Xm4K/0hpVDa/OfIhwfE+R/IYESbU0U3Yi6yxk4In8wiTV32AFQsOBYk2x
 wxzAMfaeLQz+/B+3dVUIErvrnfdewZTDwVt1PJwlEoLe70s7b0SwCfm0mU55c9wwHeki7IgJq3o
 QBcsCgae1JwsccMLIrRYY8KAVIrmvXNRvm1UgmAbJ/qWajOCEqqi9+d6ArooUfdfswIxxSJeWks
 kBksilN2/roq87K1AdKtugyuWVLRj2iEOvzTBKPl4/dSrzkvuBQPGG7Qz5yFfCBcHM/gZ7DEkEP
 4dqTftCDdx1h1wU/ShuvWGVmb1cjMDqFGfSAEXlGl2fNF4LwD1AAerBrAiXBExC5OfVAdD+wUlC
 E1ZutVJCC+0zejxb5Gg==
X-Proofpoint-GUID: Y0OuNmTicQkjaKmbhI_n_FJGhmQYi8Wr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150142

On 26-07-14 16:05:29, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

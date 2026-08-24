Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEEF399031
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558357; cv=none; b=Q/FF24CcxhFx4Obogd5mAQK8I+Ks0tyznhHkbl7ePrC1BWbrlqFDNe8XUDAm2R7PSyKxiCMDUSqPHrv7NLDtdN2IiL0TuhI/D3+6GyIc+XnzJ1SwIu8+51xJo/ncZCrTU93SXl0QtjX8JFIpaVQR5AOPK61SSwD24/32avcLzUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558357; c=relaxed/simple;
	bh=2hqvxIZr5FydskzcmkSZz+91CJz7nOks/IGm0b03hfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h+bzw/x96FmV15FOeaori83PME0PnhhpCEw477c/lmA6CangxB0QRVMzxc/0HufyCFr9GYvk3Uxy1uTFrGN+dYGfD1kmLuQDYQTe9NrJSmmXExn64pyFsMx1huraiyKWTwlW6culcy7Eqf3DuVmEBIuSfWSupGjFGxoSEvONtsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNZTul51; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SaYSpt1e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNZTul51";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SaYSpt1e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RGiO2058357
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hwy34XbCewo0bCBjlQRatKiE
	GjO+3FoHbts9Y4GEKpE=; b=KNZTul51kgfQ8Bu/0L8pJkthUJ7iFr0jUmkKrkis
	g6sq9Q44BeBeAuCJ2E1GUymNhl6LJzTSU2COMFs+9ybR0c5g5yKYBacxIb1q0+MP
	iYIC42PrRoFxw7Le7DYJxv4mI3/yGDTthrJnhnl5Exr9eA4l1yf+bY01pY7nlqQ7
	tPboVXzfVwSMn944Jzrod4fBlVOFNCnmIOC0vZsKww+AfYO2hKknJrEFS8nO/p0e
	DOhi3F+9eY3zvOwTt9L30RoKBZ/ghi/UmEmqrW7zGRvseFyaHjyfHba7zsprbZU8
	pKSuMDAPmkdazz7DVccXd8u0AfwvQnTy78QFQU5za8ewsg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr1agd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:59:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52de40127adso34825721cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558350; x=1788163150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hwy34XbCewo0bCBjlQRatKiEGjO+3FoHbts9Y4GEKpE=;
        b=SaYSpt1eG+X29qfzZi7egLPChSqRxlNy033iyd3qdyHBrrBFzOxJ/eKWWiu+gd5rt8
         nNS0wR+5io3XJ7wu60D5AN0ixQe4dEpccm3JR+0Uzpi3Ajl3Z5arDsFAkW0+pHWySfma
         giVe7tmzGjkur5KSRgodQXo3v9orQGa6wgaG0TSMUqo+FFyqRqoqbdXRMwCW+9EkGb5k
         swB3uoqJAu2iPsymaWKJ3ZIPXB5HG5v7OoscSF17X+Pynx3PxK//BlepLWWMG7iWXklG
         uzpVJXQusWAZCmm2r+u4XfaTGYjJRQvQ98RBFNDXf+j7N4zzDXsPDfmlRqOxtDAHX5SD
         gN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558350; x=1788163150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwy34XbCewo0bCBjlQRatKiEGjO+3FoHbts9Y4GEKpE=;
        b=H0c9t01ASq9Eii8MiF3h9LsyjERAKD3NVojq6gWmWupFqLwDLzM8fukvAQ3m+g/m/4
         EqEvKOCm8M48BpTIk3YckgH6PxfvnqVE5TjQh+TTybTL0DFeCAK3Fkodu/lzx8IQoB4Z
         weBRWFOml8SACJE3ou98CCcO6M0SoTouCSU+duaNVp8g2lCL7sMUuFT/+WyG8efxkrza
         PeVLvmVnQy7v06q6BdGdK0kwiwQIdOrhfOdo0JdOjpmEyo477q+q+Lz3byECg+FgoCC7
         8ajzzeoN5czXiOl7e6HbGC4Kc4h5qAUBOHngGPUOsa/ShH+QlmQGtRjuOJLE/EqC1WeI
         NxYA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/1572hMFd3NVgoCyVsoj+Jaxx04LEXhXpsHkkge09CEzc0ZIUzT7fCscPAunVtXrROB0G1FLuSMpqMppY@vger.kernel.org
X-Gm-Message-State: AFuF++lgwAdr8uV8zJQ1ODKHYNetidCF3ESIxZcc376CXL4p+XIhuRD3
	LxbTPTPYyMN5dYh4jjV1HKo4SmYxmuifmtaTksQ0bGMHF5Vk3pC6UDujOVXRwypld2RkRA/BFU+
	hS4pKIcfdm9+o+cXOn19jT+vTi+rQ+sKFEM8BMQvUCCfxuZEO/xm9V1ttrPHqO0taYUg6
X-Gm-Gg: AR+sD10MCaQ8gHlYNhbQFZ/vk5CbvKrxiU4WmbSp9ym/RvFTxu0coyC0vyIbGDYFMZH
	xtN6YISrAgmxa7fx5jGwBT6WnAlc9ie6A9TdpvWIMKygBTSvBzdDV5wWwUUBa2ttdRVfjWcmoil
	kkAtlee8v0MN7ikiAcJLOlQQYNKwx1letb4wWDVCQX6Io283xo8GFILjvHxX12RIDtF5UoPg0HG
	a75/rs1s6ddpB8pco6cbwXwYoC26ytzXP2BwJexCXuARw5dAI6/U9AataGyaB+07Fg6eHtrxEEM
	F6QRB6GZbMDTlheZW3V3TrUPlYPB3Kw/r59QX0iYhK6r03n8h6di3oQ3qoh83ExEwvz3joSlb0X
	Gx3ujq9Ch3Kvl8Fc=
X-Received: by 2002:ac8:7d4a:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52e09b80e3cmr154416851cf.9.1787558350288;
        Mon, 24 Aug 2026 00:59:10 -0700 (PDT)
X-Received: by 2002:ac8:7d4a:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52e09b80e3cmr154416551cf.9.1787558349816;
        Mon, 24 Aug 2026 00:59:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm978725366b.57.2026.08.24.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:59:08 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:59:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/15] soc: qcom: geni-se: allow selection on 32-bit
 ARM Qualcomm SoCs
Message-ID: <ssts4xmgxvfy5rctjskpva6aq5imxi7b4q3jerbnfyfn5sfehx@hbrk3pbfc6sb>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX/xrbz+YE4VQB
 FTCvPFjPnEk3CLuAgRPA/RWoTTYaMV13IvU732wRAs/ajwDVYCKJvrGfwKaRuZmk3oZDTqjjYJA
 pI6XLhVIxZhCTzVqd2OKPlRq3QgKBHAZDMphsHRKqhGEVgfIIIoErxjLQT4tJ0UCjA7sKmSkbEJ
 1JM29bwJcp3ZlHkrtQPnAkfXjm/poLr1TwcuD1+eYsX9Kbp1T+fq1DmMIFdKSpTEiMmSWusYlKI
 I0IhOM3AKJh/+I5QUAQ/f8C4LWVAequg/QjMba7bwuXn4VjZLWWvx98sN7SUc8o9BfqfHPonPO8
 F+Y2hm3W19EjR4dmpHZs+7/iHx5BJyDhNsqe6O8wB8N+31dpsa7XR7/LHdra63POFMOkGdUqC/t
 FPSYuksthG5Xr8S700UzpqTIJLI8cGjFCBD5jao3Dad3/gbBvNHyR9lxqGkaexo0XSO3xaa7EjO
 TCKOZkok0RmTGZkubLg==
X-Proofpoint-GUID: _DhxasLt6jhVINzwJ38MB1jg7mufLu9d
X-Proofpoint-ORIG-GUID: _DhxasLt6jhVINzwJ38MB1jg7mufLu9d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX3PUz59BSieMq
 gX9ID3McjTFQMM4LWaNimIsg7aExkYEYHRAzwSsfT9QAn5ZW1Xr99TBu0ZMjtEbEuux8l3oQ30t
 lSq+NG+jIBMGVzgB+OyxrisrNQCApJk=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8bf9ce cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=rpqCqEIPHYpObKgDwZ4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240069

On 26-08-21 21:38:54, Hardeep Sharma wrote:
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART. Drop the explicit ARM64 dependency so the
> driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
> under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
> COMPILE_TEST, so no replacement dependency is needed.
> 
> Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

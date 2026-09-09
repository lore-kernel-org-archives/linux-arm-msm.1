Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09157266D
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965448; cv=none; b=KIBXvT3ML+vwQ4mv3V/FHmpSREbILothewqFHONhGXJqhY8OQ/PKC2/5vFOG54WFbNCRQfFSGb1/vuvCCxQXF1Af4oKjRlI3cEjLPxVQ76k3269hZ+hUuzp5VxNQ8PHF76lW5PmTRBSKXM6T8iSHfZ7w84Og+2GEul6um7jMUBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965448; c=relaxed/simple;
	bh=htk8qv/K4eyGgE6wRDDFxPqjA1aEaZbCUEbrz7LLR28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7FuzDWm83C5Vbph4/vK9SAxHgpiW0TXSPiFxDZsK4XXOWPa3nqFjzxsHKg+sVXdJWaF0zr0BSRn3yV6vpCnD5wJr5a3bPYKYEuh444vkFDOyZ6o5cbxJMLseSvsK6swax2dmRLUhvxKVOPcru29hSKRf8v7ciCniFILX0CamMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7q7mKH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MpZID4WT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7q7mKH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MpZID4WT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CD5pW3054108
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VjXXRzrnnx8TfMPI+JKRTyu
	HaxUZ5vAOhqpXkWfWS4=; b=A7q7mKH777AFl2Ncy+u3VqVNQBmj1KUIZrjTkfzZ
	peKGuE/ccFJ2aeYfnju+y3LrD4U54uUlMLivBADm/ks85lLb4lL26P0elnrKJsHU
	nGCDKbhWqdVQD1ClN6w8VID6aO+R6KO8oM4saf2a9q9pyTtP9SIXwB9I6iaPsUiK
	i/tlW4SHGStpOVEMtXjDXuG5XFIKSabBby4NIf2ZRUwjPzqAVYXSSQbwkeRtkQWI
	8i9Gko8WqNW4y+2TXFI3aEpKWtuddLxNfJWpW/pQ7T0KePl+etcJB7y8nB5aj04S
	fwTDhOok7RRpeoPoXu3MNtHBvfSqRikCdWany4qALpMb1Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7920psf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:50:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc92350888so17678825ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965445; x=1789570245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VjXXRzrnnx8TfMPI+JKRTyuHaxUZ5vAOhqpXkWfWS4=;
        b=MpZID4WTbmWZbVfKywYAVsBk8qyQ8pbcJMzAgZg1an+3FGfVYhUOfCRn++sF73gUXj
         at4uK5phfEGLeOz+K89EL6s77YaRxXltcAPokjxHCDgwjKz0ZPqXgrcopTWB5upQOVHW
         3CppTQFiaXcCZLZwh9StT+kdb3hNZ7z6IRg0gFVWD3QVYVuXeAnYyIhJG8B5raFlJ200
         4duyFzDGwkWghe9QMHrg2H19BGtMFmRQptF6ubl9CL3rPt20dgulqvS92X+6N6FzuYyM
         A7hsbOC4QaZuwozfMCIh43fCggdBDmheeew9rrz5J0O7A8eyCGSVFvUswLUFK1bZnNrM
         SL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965445; x=1789570245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VjXXRzrnnx8TfMPI+JKRTyuHaxUZ5vAOhqpXkWfWS4=;
        b=g7bycwAKho1GCLv4yK6ae5vJlY5k09O6IK8P3TT2x8rQZckqiaZkr6aUJc2HPcvoqE
         99CAa5y8FG4W2uYmC65jpvd36llTh/gu2YYFvLDBpblI3au7GZwPTQGkpWQjERz2fU5n
         +MFRK97qGghhhcv5krcwckouMrKtZ4UsLvT+KqwAFKIrP9y0YQbY7nR6Qvg9WqIuSHqf
         Xaza7XTLPp2jg6ilxNeSWWdUYsKLgoG37z1h3v8QeDjbtEswKJFWAA3DXHfI/y0fS3/2
         Tr5xOK66/IgOIyDb9yWzQOYhZC3c1hhLY/fStH9eHhSSq/MJdRbMWcsO4/fgDRT74WqV
         8ODA==
X-Forwarded-Encrypted: i=1; AKwUvBzJQ0uw20Gt9jpZxzp7m4CImsqvrQUbwdWtzucqED/qFNwhHVGK7bc1HQCWCCTP0r9tuMdCXzC7MbOZ1t/q@vger.kernel.org
X-Gm-Message-State: AFuF++kSIeUW5QvcrTfRcGkXMKJSezGdVcINOkh1PtjKURq15w/52V/p
	S1abooOCH2sQdIB/UvfQUQr73pD3ZVSsJK6pXmBdUIv7Hotnt+vXIkMxRyCvjswZ5JY5bHJoUz2
	IAR8mLKXO5ovEafdOO3bjKB+Dczxg9MgcV59ztI3xfQpr2OV9PouXOylEFxmNP8aqNV2v
X-Gm-Gg: AYBFou3JRayCyfa+eIyhp8dNYU++ohfDEKIypZKLuVL6DdEVb2eUrRX8Xg91NUXGAmr
	1Mzn6GNsL9r6gQLRz10kUTFpO5JXK2nT8G/P6fi8yH5pRlpm3nlRmVT3amNOIGKkqlPoaJOv8kL
	6s7EcRFhoHibKbOTGvA6bmcPYa+ZfZfWaOaXA4zgxyDtf6eGs92S5gqcKKs2cVWvyoZXY955MgI
	4NY0y22xactyb4Pop02W2Jw0AI7BBu6G3jUa/Pb2rnLMeqywczmu0gIV69832sz1F0fXCi+32ie
	st8BiZ+8Y2d+6T7GCvdPTYAsWiJLyRjJpssRiEoZcl22UxtLZ4HRPGH+R1ExMz+cJ6RFG7imvTe
	btqDslvFQFOkCUIcMZ75AjNhbR9mVPFbBQ7k+vUbgoJA=
X-Received: by 2002:a17:903:1968:b0:2d9:43f6:59f0 with SMTP id d9443c01a7336-2dd07cb78bemr22984005ad.22.1788965445229;
        Wed, 09 Sep 2026 07:50:45 -0700 (PDT)
X-Received: by 2002:a17:903:1968:b0:2d9:43f6:59f0 with SMTP id d9443c01a7336-2dd07cb78bemr22983335ad.22.1788965444698;
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b57fsm75371185ad.24.2026.09.09.07.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:50:44 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:50:35 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Message-ID: <aqFyO2iX53-Ivgnn@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-2-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-2-997d3b20cf43@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa17245 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iZO5Dqbo_VVVwkFoHOcA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX6asik0g8aVir
 qPy3o/w36q4ghnn+MdM2UPcciKwiYy5Qp5glaxw0vKIuv4qB2bhvJUDLW9dGFK76B8EMRhA4cFg
 dNTZSTxq0EwaRb1g+mvnNZ5z1/3d77pyg3YOE1w8dNuFGLl/mdTKl/G04VjGiG0/6dPyebfWwU3
 MrvwE2wtEcC24h5anR6a6nV8LL/GkxS8CBF602dPjqdkV3yJJpzhwVKYzSUFHwMcF9zefY7hXI1
 WQ7RTN8O/Ykfwdu8ZS1KDTODwBdaqfQylG9ZU0EBY9l0PMJu8zeAF0hbg/pIoPlsc8bSq+YPymY
 Jfni32hjTHxG+3H9n28gHWDPVEaO8Cd5dSnq52MherH9oyLBPDRQSSU22a0os33Cs+K3cHYk6qa
 wcU/5v3njkDAeKhZge7bfWpsa6+zDIQrQXC0WShNFwQXIsS0iJ3vqL0EMFdGCCxV6KDbQRhDxKj
 NBSXIBspkwozWEbvT2A==
X-Proofpoint-ORIG-GUID: EVIOOdRpav7G4Yr-7Tc2TV1bQoGPVgI7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfXwULrAk2TNq74
 uz9PUO/6yjg5L9O6ZqfAqmSkWvfXaYtMXTlqecQcOqCLopV3l0cdcC63A7nM1xpo0+JEc09fLEG
 c/XreBRBAnUp9RXU4uu2vTpKlUQ0TFg=
X-Proofpoint-GUID: EVIOOdRpav7G4Yr-7Tc2TV1bQoGPVgI7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On Mon, Sep 07, 2026 at 11:39:43PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 can use an external system clock supplied on the SCK input
> pin. Platforms that provide this clock need a way to describe the clock
> connection in Device Tree.
> 
> Document the optional 'clocks' and 'clock-names' properties and define
> the clock name as "sck" to represent the external system clock source.
> 
> This allows boards using an externally supplied SCK clock to accurately
> describe the hardware configuration.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

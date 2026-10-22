Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659876;
	b=ZyWixazBMoXE6TZqFN8J5tCMqAXj29T89zQvWJJDL+j7bsEHzvynAOPxMf/GOEkJn7G3
	 UG3h2aRUp8c62Ykblm0xTh6/zfS0GBct/96GXFaM8bGXavECl3mfJZcKy68RATALIXEgs
	 B/8xGhK4COd7QgNylGFAviHMuJTEwT8Hd4KvFhHebc+A5zL5YD1Od6emYnXLxmFP/jMey
	 MAXg0U/7bGRbupjv4Pk0NBSKVvoPOaatyyp9+vR4Bk8CbWlF9n0EL87I4uWrh9mKW3yGx
	 khTO1wt0ROfF7e3vXw8rezV8Bbj101VcPQFPww+hhnaxUl8S8Pj8vXfgVCR1PgTXsvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
	b=Diloh8IKmcEkRMbY6HvWkWHrHDtSaUpE2sfe7y88tM1U5xmQM/sWRu9pXydI/MugCNZu
	 MjN3Xt8s6nROoQy8IZ/jo+Pxx7gUOYSoe/OpPjoESYl+saciaJOzCkRoUPYveJKQVfzuE
	 4ueBeGurIgheclo2CeqtvExjK1QaZkxuIu/4Yhp59RTakVNDYIpQMLXV7Gm8Ae+mSXm9h
	 lOSWgrDnVNvWGAlaGTSESz6QARU/ck7H3RjH636jdwLGWmCeyC5fIn9nB9+S2ndBv1j6h
	 lnoYdwwZcgtBHRtN4/A7FvviXBrELdLJfAco3/4IcyaKwmoiC2GPsCSQDKcVyJK89UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwdV+474;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B12sLeHX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11584606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11584606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iwdV+474;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B12sLeHX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705Gd4110618
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=; b=iwdV+474yLO5p50S
	vwhffizSEih/hIHI0dZ3QJGTkQPu3Pab9WOI4nahgE1oE2+USj2yzz61VZlc8u6I
	IzEcH93XSHV7M81IWVRGfLoFN64HyJMzByJ5I12MzYh4jAP14/PHX2J8c8vlFxOb
	KQ9ipcIJvarE9FHwREmHE88evVwamVvQ9i3VoqwAqpTqtyrN7jLZDDdmqby2AJdP
	7ExLBMF3XMWGLagjG5dtqZvwSAt67oUJouFWiKOK1K1QKTdBE7rlgXtJtvcIvtBg
	7Ki5oDD3DVd2A+N1/w4I9JVzvo2/5DK8QqPsHyP7FeVbecNnTkEPbznSAbVFjgxc
	70TDfA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:04:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179ef12a03so6396666d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659874; x=1793264674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
        b=B12sLeHXgtj84/PgsM9tkJGsm+B6aUNnFdQW6v7Us5vDnpjY0VbgvLSJv8qpgJTZqO
         V4rEdGYKIxIdIXJhXtXeJlAvY+jDNetQ4z6jbzlFi4AqdXg0BNgSqhWFZ9nBvffF9l+A
         FOQY9Qzo/p+7/ibaSaheTzEHJSA8vP7ofV7wQnwlO+ktKNpVJfJaUEiOetaW4uO1M1qV
         zUIze8mRQ/J/jehy/kJ0OG86yYRpNh6EGkRuEZrnytewlka2oAAC34NqbPRWW1R9Q2QK
         frMC2mNXA2Y+Aj3yUGA9iLBwZ3RrB8d/Z0rcChCm7XD9T8DJySLyJ/ToX5fEaeL2oSXv
         uDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659874; x=1793264674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnkS9k+2/tXEDPTycA0vOUMBxxhav/Et+SuLMPjpzJQ=;
        b=mw7tRAZ0VdWFs63nIB6JeEjOaPq7sxEfvVLJBBDcfzmIM4wtDbD3gsh8hw9wV01mtc
         RchMx7i0ZXzb5zQbXiYT47F67+HTvLBQINtZ9+Z3z441v1I6XPHEDVMh+yzH64YAymcZ
         6JDQObyv2qBd2caeikdpCD0gJ+LXOnpsiCfFSFy7s0Pi1nHtGYJdYI2DMc3/G5lRQz+2
         Lq/JI8dJNvkci+48yZEluPwQtH809dp9ELk8hpdEEBkLod+FAAhK+9xsX8eVLyiQQRYv
         qyu9qxb/hhSKCqjbp3ZMJbFLuwN2HVdPOoyPIha6XuPlCroQSta7C0cwbcxEKXE8YMSF
         NKuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHL1O5PvC6H2lB1e/HyhjSOtlNVHNlrodbe1kKrdre9qeayDASv/EV8emcvxczojLifpH/BM9TPMD803JX@vger.kernel.org
X-Gm-Message-State: AFq9FYIWlXlpddGVKfAX+2VLig9HM+19XaP1bPhEQlvnDD3FXB8EkdGL
	7WiKTIN+l1G5cHfmhtnKX1sUJgd3RYviFXmHKMzX4lDJF1O3bq1tY8L3zGnb/7sxddy7qWn9k9o
	d6v89rIbKorILoUNE34Jxhj4pdoYXcO9Y3aWR6n0XAJwH01eBvrGsbr0YIXSX35rM0br7
X-Gm-Gg: AYBFou2MDmHGwpFz1qRWCfy6DZJGSq49QbtFOPkyuL2yGYcNX9ST9cnPgl1cfoJVjXU
	VEEaighHboX0JcMB9MqS/bErd5LeRHKtULAXOT9nxHKVSW0qlfOAxC8jGw1+ILM5XFc5KbWAAZ+
	apNoAa6q1kN61dNDw/5c1Lzc1Bz2x6jhYdhHMk9dmS9U36coKdvOQNSJI0NUgS37ybc7Ae1APN1
	j8nngxrAUU5A8lAqkiQvPmx00//fPY1/cNpWV8vSF0v/eqHL15CTMdG99nv/5btCbp22NnlQPzD
	dHV1+03ssxMBj/6465UTxjJZ9LGuSCQ2rSuyw00r6Cv98jvDrA+cc/vueCu4SRJYbZnENjVb5Qj
	BV7I2hSISnMrQwdvK1cyQrw==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr903739685a.5.1792659874166;
        Thu, 22 Oct 2026 02:04:34 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr903737385a.5.1792659873706;
        Thu, 22 Oct 2026 02:04:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f29aesm85858766b.11.2026.10.22.02.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:04:32 -0700 (PDT)
Message-ID: <97c2268a-0cff-440c-8e21-f19a809ad377@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:04:30 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/2] crypto: qce - Only register algos if the user
 really wants it
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King
 <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        stable@vger.kernel.org
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-1-0d33c34fd0c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX8cshVm4/YOwH
 7fERrYkiQ9O3Pw0KtKaTr8KHomJ5jFMw/w2kMORQ9Y9zMb/oWA6VNdhSD6QF7PoXYDdx8oJWuwy
 3MDU/crZWNrLxQPFrYST++Hg/z+VIS3JdWzXpjIwxKCnOo2I+5wGYfHLzTbNWRiqL1jLd81WZx5
 eCgrADOJwCU9cQxGOGmjH5iqYcp14iXGZ1dOSjrAOmcfv1bgjlW9dLm1Cy/hYts7BFbfoOlnSlW
 lPVXEawEW5eVYFTBdigISoIVUovUQ9+YGCyFsgAoGbfsyahaTBTnhgU9Kc2Kx+FvgXdwEzUkMVq
 Pdqbcd2ShBpcXWhtnL9UdYAPp39EHb9DnSN5Qocku3EKOLUg+tDN4N8fkux8Jwc9PUL1VxVifiC
 Xn8z4zPBdt18IIjcXOV6hYXX9TrgDeKVuLjEu1ePhjaJlXFULsbvZ4Xy+4ctQoRdlBLujEiza8u
 SgOsx0a8edCj0ujR3IQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9d1a3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=LeLJCEefvvVT7qkYm4wA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Qaj1_OLcVdtyZ8QpmHvioNtXDcv2dXAm
X-Proofpoint-GUID: Qaj1_OLcVdtyZ8QpmHvioNtXDcv2dXAm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX0avBPUx/KI64
 gdozNNvP45ZFH10EOqJAGMhEC0z3mJlxyONQsHwfrF81QF1R4A6ETXFcxB5jeFgV6XHkCEOpnRp
 QFH2dIeR9Ph/fwSCbM9/RwdKzjQqfyU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 10/22/26 10:57 AM, Bartosz Golaszewski wrote:
> This driver's crypto algorithms still have a few issues that need
> addressing which don't currently trigger any self-test failures. For
> that reason: don't register the algorithms unless the user really wants
> it.
> 
> Add a module parameter to the QCE driver that by default causes the
> driver to *not* register the crypto algorithms. It will only be one if
> the user explicitly passes the do_register_algos argument as true.
> 
> The power-management part of the driver is kept as is to allow scaling
> down of interconnects gating of clocks by runtime PM.
> 
> Cc: stable@vger.kernel.org
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

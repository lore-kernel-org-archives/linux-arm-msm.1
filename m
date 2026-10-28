Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201895;
	b=Sb6YNFmmOVtAnM1qrVCnZi2g5/I9HVE3++cLABPiOsKFWYQShcoCaDwMeYq0rfJya+BB
	 dTRqmCfgM2C5refr25r9n+qMeVKWK+KJLzmbfWMGvPYu/0pjVm+CkS0TDRAZy3upoXMmA
	 JsuUh9qYch77StgMUayqDg53oEq1jt7FmD6h+da5AP9QhWEqXDzkwKFWL3t1Oqfyepkfo
	 d8C12+WU6JPfEIhHaweig3nCrL1Hx1KICcvkaz7Nwvgy/bA75U+uXvKRPLEcjI6YcRvNV
	 QP3e5IxMs9D5DfOBxKMyPwCdS7+i0atV3ZbACajZDHmloLlB+/A+984+CMKVt3B1vvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
	b=DZ7ZtR2U7loBfy6WbaAifhsZOxxRyX1qrZHJOzHacCDkeGRBTEojfAyxZNqmELllc+tz
	 +vCMXN2U8P/Xi7fb9fK9FMViIA8kY0XpKnGNO5lpf0zk6FP1lxz6uv+vbPK6rfy8I6mNR
	 eQtrGbeCEGFJgHE7nhIqBO5/ecBb7O5JxUSGrBWMc4u0Txgsc2u4RfN0m/ZMuLTC9oMUM
	 O6JQfNl8QIAM0ejriAiNcLwvsnUXZYftiY9xLaxf58PgIy8LELveQxMeXkjKBmDTsct+g
	 20Sv72OonJB1i46K8dn8mXLG4p2G0D25K570JnpptAMRAZpH2JMhrQ7JcYYEF0V9SGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxG9kptS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYsMWP8+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660F606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E660F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WxG9kptS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OYsMWP8+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA2172543159
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+5H9oUNQEUrTL4nN+lCc37eH
	gcvSEzquzejy5qpdGCU=; b=WxG9kptSioLFMFNbB6LH41yKmTSwywiZW4lc/rct
	YUNddip+a2cyD7X3tUt6xdq6KUNTquTWiySu9km1HEcfKYarP/KAxzYhf/v9O0VI
	T0mPokBVtnG0wdDtQW8QS4sDUPBDaHEuR1hQn9rdQNRu9N3oByQ1EpPuo1cSaGTS
	rN5pO7XWhEjxQp7Yn7X3hBn3qmEzmzNfR7zRjiMJ4UB6A6uz+gW0j4/dqTV8Ibko
	BkSrQxBp/gXX9OKw0ML3usbUYOu6zA8j75Ay7Xk3Nd8p0jj30n3mgWtHgMvcqLkY
	p04cczn21Ai82PJdv/37FkxAVG4YBtXWhFY3XoW2vo5hKA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr4vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:38:14 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c6c1e082bso38340736d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201893; x=1793806693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
        b=OYsMWP8+LqQ+XzYIic4TrbnKKxBSeFxP9AAQZ3pDCVSibbZoHYi84nIq0yeIC5poW2
         hAbMeCwvtKOH/440XU22duBuHHo5Hnt70AQB6k8r1HkpBm0bLjgszCUMdPqCx6LM/Gd5
         wl1uKN3xKe8WGQQVuJE6ZX9OlZvy0AzySQT/Ld3YdMt/d8xBPzu60mDyDgxW9SSx99XE
         SpBi6e+slL/LSUVkhF+HklgQtRrm9ZfNZ38ex9pPYZVSVTBKTdaBaiKkjSKjaxTNVz4Y
         nFNa8uhYx+KHRUcsvzprAhl026OKYGA6QSrJJK00B1Hf0DOwi8y466jP2hXyFHkDpQ9w
         XXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201893; x=1793806693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5H9oUNQEUrTL4nN+lCc37eHgcvSEzquzejy5qpdGCU=;
        b=AaM8ByVzYlYtNaxR6L1nWMsG3C+0Q4KgzOQvMENmJevkCj+gyz4tPL+vu9S8qBDHpg
         Izcn/7UtwQpz8uqg+0Y6WwnW66w82jPIeME1a7CAyXywl46H6XfB/gKgcTZNgYFVWZFw
         emU1+PxudeH/bGLcKya1tW+K2Af/WujYrrjUQ4wZ6Nh5wf5BJOZUKO8QfSeWio+7DVuf
         wJp60JIikjGtPEQPvadv5J3e1rMU+1zQo3TDLTkpABz/jKycCRzQhR7zzc1S2+KOKjhg
         ezwPpVbcYcnm9x5pOWR5V/d2BTUsf1gVIq8FCTcAsgaqnGM3T2PEHAhlpfCpjvHHzIhB
         AKtQ==
X-Forwarded-Encrypted: i=1; AKwUvByhTxgwDBWziKlXbeJBtwDIQfqvfc0IKrdCJ/f9jJSinkEZoQaSLISS4ttwUU1BT1vG3MM7WchiVLyOv/Es@vger.kernel.org
X-Gm-Message-State: AFq9FYKopTz8MmeEwr5Nh1vUi8uIBdLSowODHhNVtxh/w9v+5/KWMD87
	97ZZb/P2XGvJXkfS4hQ1NccfKVMwergURdsuzlEbp0QgAm4qF/hqfDAiL+gtgczzmu9cOHkqeLK
	CqsEQ1+2clVk1ATA98YItdcRMrKANoy88n6B0LgSFQX9/JBaIf6zK4jn2AToEhc1LgMOnSUENqe
	Si
X-Gm-Gg: AYBFou0ihZR8Nmd4n6AzNlO6iezc+Lj8xsVV3BxLfJBJB4f5P63q/5Jswcn/XVOeKPP
	0yELhlKSnKa6IdvkAAdsnCk6nd0ooo/g3YcLxv1r0E195KzoBmuGTAPnW6DLoPWi2FzWJOqedCS
	JkE4sgnSM6TQNgfnlN9xKf6al27S9ng/Mox1+xB5unDaD8hYU40iU0IS8JquL2aKEpcuomTLKW5
	JgWW1MZDiwpC6CpmCLntu7LgrJ7yMVeATOQfuEhUOJ2p0LArqegejchbWASK8O9RIXOnBseVSzz
	j8ns4xO/AmKSWAhOWXJiYjde8+XPg2fB/9oJI+GJstSjvDADg41ch/plEJSd9LlmcsBjdi9cWkO
	eQTrSKhTLW6+6snWc6PMZuVBmjsmHxm6jtrL2uyRXz2r84FtpGeKzVXFtquYCRYVlzw==
X-Received: by 2002:a05:620a:1a24:b0:93f:231:9ff with SMTP id af79cd13be357-943f4bbcae4mr982322685a.27.1793201892912;
        Wed, 28 Oct 2026 08:38:12 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93f:231:9ff with SMTP id af79cd13be357-943f4bbcae4mr982317585a.27.1793201892312;
        Wed, 28 Oct 2026 08:38:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4806e208sm23540563f8f.40.2026.10.28.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:11 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:38:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: monaco-monza-som: Add ADC thermal
 channels
Message-ID: <quoe27hatyo4mgfvlxwpbzzo5r2eowt5mavnrb7kdkbxg75ea6@ubfvs2oxmz3x>
References: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
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
In-Reply-To: <20261028-monza-therm-v1-1-dfe4759c15bd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 0l9kDujUG6W6tSsVBUvugvYcz6wwVtqD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX/303poM4EJRd
 FXHpWX9Z8ajOrYDwViTanET3DyBB24qkWZLGu1nacx3/AlR1+ogYUC0mRzNQ8w/NIcEGjGNBhcV
 kVGe/T2nCHSKzWkGjVX0gOu7TD9da7ZspmPWzE3C70jtfS6s9SWITNKwRN79cUDA8Z3rt1305bz
 fqaM3TSrAo8xBQYVzibMonmxIa71qfCgN7XQW4ik1hUj0tqKlFApK4qWcKKoJ1dWl80alpUQ7SV
 ZvexcgGmMUbWZRfkKE0tMad8ZBpMG9A0809N5Lh8CyMfItd/ZB9SX6j9UwlIeTFpqSKSinhh4TU
 EYZZhd/LsL2jrXr3Xp+CksJZ3vrWVJm/pGxhv4QuVj95vUwF0n2x/M7nAeOYPNIdzuQEWugbxUD
 s8i1bIKwEtTy3T+RJK9K8jpAGeqyGu96tb1y6ZwT3makbG7zGtDasoDigPZBCqbb9QPzmfLwFPR
 mogHUF8jRNgELbvpJ3w==
X-Proofpoint-GUID: 0l9kDujUG6W6tSsVBUvugvYcz6wwVtqD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXykvum9Y1EyhX
 RX30SrfeSEclnI9w3oxalABSz7ksD9vNMocRGfi3fT/BgJTeLIFqQ8GiBybVQjo4aWbjoVTQu/c
 h5R23rAqTfGSz6x1T/0b+oybVQx+TpU=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae216e6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=v5taVqJvphWDvZxw_xEA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-28 15:17:18, Loic Poulain wrote:
> Add ADC5 GEN3 thermistor channels to pmm8620au_0 and pmm8650au_1 ADC
> nodes for thermal monitoring on the Monaco Monza SoM:
> 
> - pmm8620au_0: XO, UFS/eMMC, and SoC thermistors (AMUX1, AMUX5, AMUX6)
> - pmm8650au_1: SDRAM thermistor (AMUX6)
> 
> All channels use 100K pull-up.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

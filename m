Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031688;
	b=wO+tg4HcWmqHKOXSx65ZIinitQLI7dOtby9MynzmHrddwmqjgUIWcqf4DXINLYI5TWqm
	 aUyJgipAC/W2Ab27zkqtFA6kdp2HTczMPXAErJRo+TwNWUmv0hRY9gGWiQKnzQ+va2nl7
	 7EgurI9/cjZZYT59HfnpZvl1EQn7i0H+b2awk9cn8+McbVPuC1siPS15m878kCE1dfzdz
	 G+7qh4f9WQb+nVqm6O3wDuBa07Zzs02JUyxxuu5YKe3mDr+jZ8ASnukLrfhvGpvOtY8rM
	 ALCkwYxC2InisOwh54Z1zWCmEqdNP2htl8VrS8wNV/uPppGGepQoq9Y+1no9Nr9CvsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031688;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
	b=UqWb93qWjtMuTbJWJPJJvp57bSVy0aFNwfKV47b/5H51LN7uzcFvBBSUJKZ5/Qz0w1M4
	 l6e2yZuSuEuRBaVmDzlCs8nIaN96/M0iWnbwfB1HieKhbwS5h069j7xja120OCCwiN4iN
	 QOSrDq9lOXLq2ARRL1J0qeHud/Qkj27cPnErIV885jWNnIoOubQ2VRd3FkWXoCkBQOx3K
	 +x9I0pUPWui/Atav1bjIgiIluvSUlaYPgRWeT8NSVArmPfXE6WjS/k+Dc1AUZeiXdYx/b
	 LbsDdsQjjlsWX2o5Jvj6vFQM+dd1nMoOHX4SNcc1Z5KU17glPAmSnMDkh3wq+J4tuHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMf6z+Av;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZkI5UAR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD1606A326
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FD1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMf6z+Av;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JZkI5UAR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvfO24168000
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=; b=HMf6z+Av4hsat1cA
	E3TYRAuFE6bynDgGA8f71po/6+SAGAO6MDF1/HqNk7cHqyqblTeLpKvmFLKes1e3
	7bVyqoquN5l56T2gNhimVi33stpXnVhGaWQmr/+ApfPwemVjDK8ARAR5IbBYGiIH
	mST8vn91Y9x2mJMg5onTlad172Rm5x1IAehPtnbBkuVLSl4bqFBjqjEbHXh7sjlR
	whQpDJGjjNc7Rv9GxSpwUAXIsA6UpRLhOo2VTmbEiis6nte3XQT0qgA6i7iXp+Tm
	gjm5mFYVB8okc+sur/M9D2T5+8Z0Ku3mcuwmkbj3dXkT2eOyjdjFvlGd/iq4O8PO
	LcGstg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf1es9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:21:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so13280385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793031686; x=1793636486; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
        b=JZkI5UARFfwrUrgZsPPCGXF5PcTCU8oRvU+BpBoH9CSUpx4JsL7Wnsk8mYaU6zczeb
         pU1VIHs05E9aDtw/iK5k1iG76ZPknUbOVfV9vq1x5cOt6aThmoaZxBiMCNUosxV0dz5b
         0Gb1WyiRx9AAHnjC11V0UQj0Brme/9mxypjhSrZJm8JlP/5r/iBqby0Sc/YUFjnxOY9p
         f7jviSZXojXBK3Wjm96LYSmZOCUOc7AjXbUiNACwqNdrhRJVS7zd8YZmF69jiBTQhKB+
         F04FU+lwu5PPuylayylaU9Iul9Cm96Qj+Xvfg8ADt90V3B9k2pvdVuRW3/mk8m4itKRS
         b8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031686; x=1793636486;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpfIu9h4v1MmMX9uhVfYlN/QPPW9i2E36sQgqxW8Vxo=;
        b=mdYdlfWdpLkJEsjYLeBInj7cPEZP1jH8LeuhcSPIR6anfky4t2k4jOeTBUWANdBBMG
         nl0osf9FuW2hn+TWzAH+jBuMmq5uL/ZfGQVKbPLxt2upHmy62P2ullI9vakkHu2k9yXZ
         JUZlaugZWzMy9NZqYt/W3W/MvK8U7yabW4Fr49J4ujzkuZYHzDItF5SDicd2OgSkSNML
         I27+MPkA35U9KkwhOt6rh3bzYzp2FB4jE724OliWfyfEcUWs3YBIpbKaLPbC6WL2PPZT
         Q8yzKfMAtnVPMxPaG17BUYQJXCDcC9Yq0rmUi2xtLK9vorA7mFw/S8ATGZbCeL0JZymi
         SyGw==
X-Forwarded-Encrypted: i=1; AKwUvBzeXi1uVEN2iUjI5qmWiTawSsMTpiE7ojGEHJs2mOBrlGzN2qwk+Luoj9m7jAWIDLbYsQZRh8gRF40tyE7H@vger.kernel.org
X-Gm-Message-State: AFq9FYKXNDPwGVU+yv//bW1uKlFqbwQ+b26F4zlZsh/JoOvJDlCaBLg2
	nLyhRwlrUA2doVBhlNGxIQn3OBE2ZBbXv7auWnkijnC5KFVX2FBFsvp5xAO4W2HCW6qfuosB8cA
	tAmNrRc8pQU89zod46qJx8xEn3+UXzFIKbsWvXYwbloERMGWXQSu0otZ3g8/mk3eDnhmJzEt6T/
	Pg
X-Gm-Gg: AYBFou0IfhiPVFpk/3fAfNGUwjPIITW3OwmnNW52+x/GvOKXKztXfwq0vit48oZ0xmY
	j5Y4Wjz5/a/BwDXI/eLkJQadvm2eyPwJwDYf/n08qUVmSUQyLwbcRG7spdv422j5UIKiTVFbK6m
	RRq3pf9jD71RhD4+KqMvBqIrGIxIrF5iMHxsOhgq1kFVSHzwA9XqGbqSPc+pFmkMro/ntukyY2B
	0t5bcmcX4dY+EVkYUgsnUs+5V+wxWM1SuG2duYI2gt7yDn72P4BLgskHkkPcs1cASO4Sa+ghXw+
	PGEoCoIQHdH1zdEa5iq0asfGL1GCxqQ/hAx9+Nt7WIl1GulA/urxVSMN0cZYfK9ZsAV2Utuaqe1
	YX7fibBEllw==
X-Received: by 2002:a05:620a:40cb:b0:93e:5677:317b with SMTP id af79cd13be357-943f4b9fd77mr27074385a.25.1793031686234;
        Mon, 26 Oct 2026 09:21:26 -0700 (PDT)
X-Received: by 2002:a05:620a:40cb:b0:93e:5677:317b with SMTP id af79cd13be357-943f4b9fd77mr27069885a.25.1793031685633;
        Mon, 26 Oct 2026 09:21:25 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm16672814f8f.23.2026.10.26.09.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:21:24 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add initial Nothing Phone (4a)
 Pro support
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011095221.24767-3-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
 <20261011095221.24767-3-oleksiionchul@gmail.com>
Date: Mon, 26 Oct 2026 18:21:19 +0200
Message-Id: <179303167977.154232.6751719629027662314.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+BJxzzb/3UaiKcQDTKgmEhodid+jkh7uF5gQsqTcbik=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq334DjMKzinGJHiYUKdzYfyhvoZ1kX1hcG9DNr
 ooRk4ZF/9mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat9+AwAKCRAbX0TJAJUV
 Vlj1EADNmsMb0hjiKR7BPwXUNIwFTvxkeYgpO1OMPW6XHeOko0EWQtWqUQ+XMaD7klaaNlD8Xgx
 4KGN69Osj+KSoFFQfRpPHt9Jpayv2x+TUgfmnKw15q9zy5WaycELIn7DfEdzSQqu7CbJQwKxEhc
 2IoWZ0FcQl3JoRxZhigLXqLLGkL/Y0JfjmG+6Mqwx1XSWRzrgD7SMwaU8T5phzaH0x7i4XSx3E7
 uLkW5JJ08DPq45SADyhrziA1a5Kjfq8m8qyVKn79GGLifOvt/rQpDGjzy8PNFdtICzoo6VFg/T9
 SNCF7FtipNxPhgiQpLQyHGlUTG4fEWexPF+yOUFwxJ2Kow+jfRvDdL8FWvzSGjf9XCqtIicMFMV
 7HyqChaVMHihMLMEQ1oVcZ6s+ODr9/20Ls69tKJmCk9yVdytdpAJWwcrFowYeYxkDy+Cjc1Ojl2
 7dEhwwJphPtCWkXZT2v9lGD1E7RoIK4YGI8XZ4KPLwrigy4tGN9VP7UbsqE6fKYCmQ0d3YrcuGC
 5Nfg+kc6tcFzyFMpjfagSi28vyEt+CRLh8tPrBh9ywhgIjCsjY4lbyk14KySB+vKDvEvlTF6qh2
 VD8XaMVIxn/JjfRgthLosfLOKPJaU891pZTByX/LvibES8F+Ugr4CwABya67jImz45jugpNK7CD
 BIcyPxY/i9vx0GQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX7GuHo1numbJN
 sp2Fmyekl439+UDSHtje2o7cdwycvUmV+j6qS5YkNYoT2SscZrA/81hcTQNT+UGjO9ANCjnoPm/
 TajWz1BpvX7qoNHDNgwQyWHCSEr9Q74=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf7e07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MgpTML6CSb87B1fD_mQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fkipU-22qSEkyfQWM2o48Mgi3-gUYp-6
X-Proofpoint-ORIG-GUID: fkipU-22qSEkyfQWM2o48Mgi3-gUYp-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX6P+3vWI6G5d8
 Uv9cs4E5XlKoTLnlNZ9Biw5a9PuFEYlM02LGc26bPI6z1bLfjeim7D7K1QJlwPozeT24dZt0NFO
 e4z7DURudB76lb8CKNu2PosmHV59aTvlPP987MOXWO3D/WxiMsJnQfJuw8bi5XOU50sDUGnlyLp
 1WsOHM8aHC6R66Vd1pYaRoEpTN+sFS3kw7RndljoyHC88M2MkMcx4SG20BZ8sr+83TpVK5kFqCT
 nrrYETjDjm1mke1Ea5sRpmbOXE2ggFlQZE/CGuKlR/r0xFqDLQOOdcSO4vpkIfe34ct4CkuLg7Q
 cd0SWdKkZiWSK0ZDOXRoJ0GJ+5U6LclI0bNp3TFa3RmG8DxrKyKwbDdVI7VXDt4ZrM7WNVdyNaO
 PPDZ058gYp7F1Gi6DqKPsttlKUWbE8u5eD1CUQltcGyciPUOK7bN67cE6VY+XAH+ZDE/FMHsZ2y
 vjTFpZJNrCYdqZysViw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260065

On Sun, 11 Oct 2026 11:52:21 +0200, Oleksii Onchul <oleksiionchul@gmail.com> wrote:
> Add initial device tree support for the Nothing Phone (4a) Pro
> (FroggerPro), based on the Qualcomm Eliza platform.
> 
> Describe the UART, GPIO keys and reserved memory, including ramoops.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

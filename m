Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633706;
	b=aUKiG8IosyitGXMqFbz3ffUZkH6lO9vc0HsHnPN+UVM+rr9WmdxMYT1/p7qdkkOJrF1Q
	 5+8WI7y9V+iYw4FhG+S3uqj9bRG6NVfodvPiG6UBfzK9CHtUip8vEIluPFYM7QR1ZbjKL
	 JgBqTozXd3hANrU4h0zD8jgaZCkzLy01R1NFgx5SlKKA+6I4XQR8Cd0P/wIYxfUmRq9AP
	 eFT5PKeUzx8j1s0TtjOFeHqrpAogqMDA8ceV0A7sbOVD/56tdMN40DKZXdx9lrHI1DSlF
	 dyE6dMR1SWOavMFvQgEtAb9cqxufc1QIhOzlCxJPUAUECQpLuDNeghwbsJSCtIY00Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
	b=ewkOHSkMnXCCRwKfIPXRyl2R2b8MQulQILa1Q1BXOpllepSyVQKx7civJgh+VNwc6q8Y
	 F3Aikqm9SDfp+S9udLmpxR7D0A5cVpSUI82frj70ld9+VVjJDrvzcQPMCs0Y6ZOTARiLj
	 mXnkJ0vLhjHjJAr1r+e2+v2h4m5N6UthyH9hzpbKY5Mt4NoyTDwMWpsVo12GEODtvJs1O
	 XFDnejUwRZccdu7v7a+8zUa9hoVn8AqMuXV6L2LYiYs7bEMFKRkpm0qPWMff0EtkmWING
	 SBZKVJsTpHUtA0wg5jfcdQ2j+LNWMaqF3zHdrCK3fvzC6zed3pIuVEQ6vbdKcrTdGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhfS2aKU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMD2HDC8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846860DDD6A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5846860DDD6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BhfS2aKU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMD2HDC8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpN2o4070520
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=; b=BhfS2aKUNTCYpxkM
	WpAQunypo0j5+wjNL8cPYdY5uAqXZZfplp5hB6TxUIiOLQ9kZr9j5kn2dYtcLC7p
	9xuJBDj0O2l9MDs3du4Csov7RnhqHKYx+X1QAsfV+larb/JnuOic5f4AxZa7/6U+
	N8m85wkxxraowHlth7+TcMViLV+JafJaGROOK8SB49cEipH3Z0qYSy/UOGGVjccz
	04iJqes5A9WTxTbrF25r3Pm+6QKFWuKE+hQfAjXk9OgNkmqqSrb61xVOz+a2I1mS
	jXeaUbS2TKE+YwI1cOnuf8M2r8PrOWY2QvmhC1rBuYMB+yfVYg3+I4I8HRGnbmvu
	9m8izw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5gynm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:35:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so272781685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633703; x=1794238503; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
        b=VMD2HDC8lPwCsV3Lc2sumfW/xfzpxCnUJzsEns3rO/QIcbPPbZytmFIsnFRlZYIoL7
         Wj2KLm393ZG8MLWYN3OB3lSMLElV20aZFFSALUEnb5Q+gxG6MBxKTGmpeBsotLAFy/Ac
         6XTn24+xRJag/wb9/i7exw9Cg2E6jFV8R9uc8HjUZdqIESgne3SY10+yk6zFfjjFs3iq
         WuQ3Lq5UUWZ7HR2wGPG0R/8WyHrK28+g6+n0wfF4I3EtPipnr+5CTz0TC4T+xv0fohiy
         UpcJQaV4umkdvHVlfeFGSTbP5IQGa1SgIOJ5Otqdkon/KE+g75yLVMjj3QCXgJi784Wg
         iDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633703; x=1794238503;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Im+S7OATYV55RTlJRWTnOlVPoY5epb+97tvvhTFQtO4=;
        b=m/wyhnsN2eSCMLfF+n9GISOAOAxpO4EfJ8Ko4PvefMd24THkToHJuZeGSRzQOOCccS
         HCGE8nDHwqoszy323ALk2F3pfX6vSXIJ6oaEdRM5B68c7dgrh8f3OPB/9/akgpkJB/va
         i3vv9P34LOSET1cuQrT1j6cYEJYWv+iIZ4tcO+QX1LgrGcgbU2BQBeCO3HTi6B36SrJh
         NOau0IovvcoznusSQurXOZgh7noHcinvlaonMFzBI4OEofdrVY9dfvY3s/iuzxaH+v6x
         Y9KbnDjvUiPjJkqPmYKAujd2yEINVGR/vHsXt+EcUT7l/BJRidyCn4sEKSOPnd/2+gFQ
         IFAg==
X-Forwarded-Encrypted: i=1; AKwUvBx9GRxWXtdnQXdpaNuISs0CNhsL6rHq9wy9moXOZxwrEqsyxqUA1/bzMB7cg9B0zB4ccvV7im5K8LV2VSvy@vger.kernel.org
X-Gm-Message-State: AFq9FYKnlwVBMDJpzSqDqQm6NpCStNkgyh/iZGAUkbm6lJXsX3xfbd9U
	n5MUgNLpLLnQYOr69o+Q5HkBE/EBMgT3vw9y3/HtjTxSatiJSmjzH/fSNRHTWJgIrhcyrCoNo+T
	YsGOCAJ6OSVR6N1LiNnWuCUpv5zQg3131kMiTVKY4Dscluc3RW7UHiInqVpmYTU6sMOjgiHtzHz
	iYzBw=
X-Gm-Gg: AYBFou0hJga8hMm/WTPxhF1eUUddI6PLXpKCBkFAEYv165fm0Yit48mG4bU17W7kLeQ
	J1Gk0dQRmquutvZdjJ1YoHbYTruLdLzVNpucxLJlEtJWM1o8ujY/bbA0TqvK3p1DxFrQFDedT8X
	79kf+fbRrm2zXVuAoiFa6Xzq0hTWIGBvFT5g5VTn9EsZVDJ+MLaAWlObEMaiThRCW1FRkHRbLM/
	ccy1awabWvvvRRaQy8XggVsWDvmBgRV5CUd7R6Ggc4p8NpH7hYX8hVBw2YYpXcOB/o2yvXiaS4B
	qlpeWn/Znq0ikvE9sShougvJt6Q25Ui9pLEMZj4qfz3mY4v5iiTFZ8lQv4CMF+MY66MOQKHgNvx
	zYwq3RYZ1e+jG7NqzcYVKOIVAqgmpnjlWtxouFEpSQRkGS0UgX6DUM2ophiq0Jg==
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr1793780085a.28.1793633703504;
        Mon, 02 Nov 2026 07:35:03 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr1793774085a.28.1793633702987;
        Mon, 02 Nov 2026 07:35:02 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm525422535e9.15.2026.11.02.07.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:35:02 -0800 (PST)
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
To: =?utf-8?q?Lukas_M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, akhilpo@oss.qualcomm.com,
        jie.zhang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 15:34:51 +0000
Message-Id: <179363369156.2770975.5059354905602709812.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=jj5ynubULAVAu/vUXiY2INwFxg640o1bS1NRlUG6T9s=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBq6K2eQZLbsRd/JAokYaR4x2+9Z9XOiqMr4YVdz
 ovfRMitxWaJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCauitngAKCRBjTcTwaHBG
 +CvTEACbcal7iXqqAofGdmicRl2cJsLK+DwAYyJow3/HSJbdlFA5va1OP8Ytf8bRLS1iUgaA16K
 AV1gWuLCzZjrMgJLrJNZOIyqcQcBx8xzEk/NeDMJMrK2WCbPdqZbvRlsEVJZLXkOivRE670I4wR
 cB72Sui33FEaKL41osPIb6482bCZhcw2RgaueKTgNFrXt9iQpAwyTt+FZ6utm/pkV83hdGQ3jdp
 NxK4UXwGPWFmoYBTmehR1ICIlPquCQ4Vrf6kp2fnqXnkxOaWdgO8X1eXigKat1DdBTxf0klkZJP
 o9DCmF5/qH9o2hN4GDU8eQeTYofKETV5nkD+Nv2XZJhqyddmYQMfRhIIdBMNwVUhQjIqSftiC4A
 vDTTusS/S8yrceGbKn7UeF/9xo9Xtdy2xKihi7CndzcgnGDhn53biVW/XWeHvMiYerEG8tGSZcx
 Tcm/orwCRDWVmy6ZnbQzZ6ah2oejzYc6lTPlG7JveAQUCTT/LQrMv9lnWkj7RpdA+Fl1JfJXumC
 hhSgIqIn0KU1+oZekx1BRdQSXI0lYcH+1a11tJMf4REGPWhB03Bt7RMD1FvZWCwgegz+3sTgyfF
 8uZZDJ+qH/YmTmwgHJR9As7GzYMwpc9+DNNVi2j23Qui5gpQgsSw4V0qOxJSebMRzYIpabpb6Pn
 0Bcg1Rn91uBQR0Q==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8ada8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=HiTqMD5rzcJ12mVflysA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Tvk1TlrMQw7TGO_20-ocbFu9T0SH9zbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfXyrg57uUTI766
 djrKPMcAgXXpg4pe4OKJ+8F8XRj0MB1wwpbX21JpE5PKVfjbMYQPFwM8ZRt8nXQBfyiRKRvKUzc
 oBmo2qIEDeDs7hTYrf2eOkRP+zqE/lRetpapHGjsLlMkJNDty964Egf/t8FcbTVmF5kyklL2hDw
 9N/8NVgFHF+9/rARpsyMR+tVozV2Ho3TCD0OY0+LUuNLsb0WV/Yrei+QUB+ftAapaJ+ivtpKRlW
 F73svV6Nyou0PNLLw8oTaLdxfg/8FWyRS+spBi1hoss0Wr8hm94nodpgq0njtF+gRqa4/fsO1C0
 b2rrBIAEj/LP4vMd/n5oXmLD10k+yZUa6GqBPrIOyvWv/7JzijmUJB4e2y/yUL6DpyLLYmFljtg
 HlukJuf6h3yCuFB77iPWjmlC+xFgKPg1u4mPfTTgRjaeSEzkmUM5rtInJIE9yBM84XRU2+4zofw
 9/53qETp5fTOhk+wMZw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX32YwCbUg86Vt
 vPjAL5n3NzybZ2W5rbLeTvT2An6V59JEswmBYcclBI9ZdZd0YNgA0uoIGS/6F71q6xqTdZXH5XY
 Rwvy0B8zGOmEXN/DQHaHMdDAICwbfB0=
X-Proofpoint-GUID: Tvk1TlrMQw7TGO_20-ocbFu9T0SH9zbk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020062

On Mon, 02 Nov 2026 15:28:12 +0100, Lukas Märdian <lukas.maerdian@oss.qualcomm.com> wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> [...]

Tested-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>

-- 
Christopher Obbard


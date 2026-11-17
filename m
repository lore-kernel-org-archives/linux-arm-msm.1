Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910165;
	b=IFXuLW9qsl4Q4ypDdO3jJCeyzGbXnUrMkcH+nNdF1xo6hDLj4+/Pd99Z+3HlbUyquada
	 grHuK35JgPsAFX7XwcH9yo/ng8AxYmBl6h00tjndjC8V88Eu1HxZM1e0hMh+XW6Adluu2
	 KeiVU10WjZkXJPmcEU9QqPeVSvm4afzk+oVXupPc1q2SAwOfh7ukUR4CsBD6SiYVyFKHe
	 0da7cWKLINe2ECqkbKQct/XkK2IhPbAtb8rEx6/g9UJJJu8yiqLC5pXAX5BrbuzpHEYuc
	 E6uq393XAsg1C+Y5VIc/V437lvyZ4GjJWaHH3/2kM+vhvdwdKC4pX56vV4xkdP6NdNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
	b=0od6/m1x4FhvG5rsXduzjfAoJhf5RHYE/ieXxwViE2xbLaWsnIqRctORtcE62N0dbVaN
	 v+Ioxj4RJguMEy9czEG50QDWpZEYi0wW6AGEMPtHLNbJKvLX3nxkfaF4v21GJCi+ShyLz
	 Ih+8NpqSHT5mOmnYafmVK2U+23tx5ROCvelHLLxwGXSx0tMGaw42cdkH45Cv5zK4xBuY3
	 q1kKihXrxTZXMJZEPCohfLeeODOVNmqHxB1L8uxa3R0MGr2jIMZTYd2kSQ9BH8k/Uvg2U
	 1v4Dg7jWncQBhn2jKL9/NQZbbEXpS5OdtE4akzQTKwvKMhL+gb392O1H+X80QV8cCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f5w4MkuN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e27TCJNI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67290606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67290606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f5w4MkuN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e27TCJNI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NT2S721754
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jca06DZ/VwnBNDjjcC1Z70V7
	zzYoec5uq00WOVrwmWM=; b=f5w4MkuNnugKNHkMWKAn1+WUTP/VE0UUFOuyO2ZK
	G4UXNVP9mlvSmxtkuSycu0Eiqd5Hqw0wnfrUH6ygf6v58c0FXKW855rQ1urEUO7R
	oYJrytQIxM+EFW0AKawUKZh7LFMUwWKcDcOrSKzyFyidE2Fz+OxZ74ORdayhwYtG
	CApB5d0Cm4hvqBumIWW08n56ogrgWeBffsVyXVUmCRp05gpezXVr5o9kYvvMzi9u
	rRCTxCFPdrAGgf8vi1x9q8jyxiTyK5OKmkdJRfLsSBV0RrqglPX6dSxzZEgMjRQ8
	9oL9Hu8A62gy/lsWuORbhUWIBkjFNEa6Pctzp5GJ68wfag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc8dvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 10:09:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94970ad532bso400286985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 02:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910163; x=1795514963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
        b=e27TCJNIBkeVRCwZp1sSuHWMIQ1VDHJAa7Efi+S1y+Ql6f1z6SLk1I7BZQFNfJMhMa
         Gc6abmBTEaudbzlFliJBgeWEIsNQo2EtLKA/eZIf7m/NvXTZeqRRuYte7qmImHBcjq3m
         7mGCtW8Y/xQbw+0hXqFRDC2bHxEnxulYZDbEtBIwyTVXPsuOqmcp2xU+qOquDXYqntEZ
         GXvQ+D3Ys86YfOBTQbdgFYk19vWKPpu9a8MKAoZURMu0K0XJAaIk3bU2T/uo5cFiBiqt
         n5ZZkaOhRFveFNhFNwJRV/hMXIGllhHSdSaXONKYJi7istLo+035GP5Mp0o5tyDPVOPA
         0b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910163; x=1795514963;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jca06DZ/VwnBNDjjcC1Z70V7zzYoec5uq00WOVrwmWM=;
        b=RVsPSu/f1eeqiDB7083PlqiZFSgn8/A8tLwl4KQB58JktGAOTedvfmkrdCH2idaJMf
         vkykkmxlRvoNiswEDuJCh6r0bQ0ZB5gzdWArKx0AmDgymPG2TJnTPXvasNjpjzva0T2L
         vfouk3bAnFM2wR9Zd/C7LKfZvY0g5eGBZCUNKMZOqFm0Jwr/do25V8YpyAxkv4+1Ns3P
         IPIUcsL1Eam+oybAAxj6QGqd8pNdjlkz2H8BLFx3H8GLNo2/cse1pN1kAeEqan2cRYir
         cUO7uSpqFEjPPkKZNaczQQK+BNt6oVihpJcfTR+v12qtZ7S1zVDPhA7UGUd0GE+tOgii
         alEg==
X-Forwarded-Encrypted: i=1; AL+hErGRODMzKPYkZ+UGEW8anXmvqGogFaLAJ/zxzsiQIzjgxiDoGjixAgLTXPmRAQfPHTkn6BDPRDBh/gfnL/Pz@vger.kernel.org
X-Gm-Message-State: APuU4Z+AZBJHbTkTrObyHmIwVPz30fw2dgUr6+OABIAxpgpHV1+KS9qP
	Rb4BEK9HFONBHNmWywT2CLIsxRePMcl01lwKMqJrZB7ScPyj/gsEKU1CcSpUOBA5zRwFdSo4Epr
	DZya3UX6HHQgLmGsczN6iI8TmTCRWCWHIOiC/iKC4CU+8Kpp7idFFyc8RqxuzJ3+A2XWT
X-Gm-Gg: AYBFou1aCPZZHXjto+cDwrbooW+3c5kiWQVKNL5IImsI9QWBJADtM7lFgujKbUsIZiq
	aUakxdU5eIgBsdoRtOMPD/7X1d6lNwqkvigOa8VflcmwNgKY3fKBumlqxC5Nxz/p0dCyB42qj2G
	EPricZbacAeVeQAt39YfIV0jnxKNsYm8ghgcOUE14EXxgCLEjADVUn8Cw6J8ExiG3REcyRhjdI1
	uHNP9xk8qO/9Hhky9jNDT4olcvMdqwCALm2+c0Uhnt8sqG9/Pyvsp9WnrOZ4ryTOR0am8riLvCk
	ilvTIQ+0xseVNA5ngFDfN7aMHicjiO0zB6+pOpb3GGkmRhryToeJA5MePm26pIXPNqDGcd1d99B
	/E6PPIhnCXYgtYsk5Honm591urEKabFOe8YidJhBFOyCG/7dxQQph+ilN90c381x4
X-Received: by 2002:a05:620a:280f:b0:93c:6028:6d2b with SMTP id af79cd13be357-9494bc3c155mr2081412885a.43.1794910163091;
        Tue, 17 Nov 2026 02:09:23 -0800 (PST)
X-Received: by 2002:a05:620a:280f:b0:93c:6028:6d2b with SMTP id af79cd13be357-9494bc3c155mr2081410185a.43.1794910162514;
        Tue, 17 Nov 2026 02:09:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm27416482f8f.28.2026.11.17.02.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:09:21 -0800 (PST)
Date: Tue, 17 Nov 2026 12:09:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: eliza: Add iris video codec node
Message-ID: <nhbxbsvgegih2x5sbyl4p3iczjdhv4oenq56e5gmr5klplq263@5v5agcijseya>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
 <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
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
In-Reply-To: <20261117-add_iris_for_eliza-v3-3-02a55a9272ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfXwaCt0Df+arCx
 SIcTWSuoB9SkqTE0Nke35H6BIdKkpMgjYkAuwwhwvl6BKKy1O1TuFWHfCqthapHBwQpMPwB01sH
 xP640+6o232xrJxJBIujYo5T3HaRlMs=
X-Proofpoint-ORIG-GUID: 3dXddHFz2CIpvQKfH1dBQR2eGd9MiJzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MCBTYWx0ZWRfXwcEjzm0yX+bw
 DLuZGqDxy8GNpnn9jhP6yFiBaAI8rT+8baR5Aw73a88gWCsdmy6NgChKTt/B/Jr3nEXCAdcKgMc
 qSdZI8KS1GMHOPWZtKftrA7yVgH+1fbZ3HvQzJDhBdscKN31tRg0EGrf2QJDuTloKOy6ZDgt3hS
 b5H0HLG6DyJEatOJY4DcnhVuE3YfkUKIDsE3f2wsNetQbdD6Avtyb1yVsxk+bLzgFDibkRLhdwI
 Lk8TtFIKsKafghCQPptG7V5LomvHOC625CEEFe9CUmZk9C7JXvh++yE7Jb9ynFSEtCc0knCjO/P
 EkgpL0HX1xB5IPMVa/M5FnOes8BSFpNrLYF/fxhfj/ct8/xS3eJEtFqGDyvJXw5BYTUzrBA82Oe
 4LtfRLJXD5g7Y/NuYO6+1w2xFLqAdSlXEhCVqjBFEIIe1wJo8r4kz+/u1f7VywAMlMvW5OfhK9F
 YPXYlN5/9f1Ww26e9+A==
X-Proofpoint-GUID: 3dXddHFz2CIpvQKfH1dBQR2eGd9MiJzm
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc27d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mbcfl85LdsPLy9AfTWQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170040

On 26-11-17 14:34:32, Wangao Wang wrote:
> Describe the Iris video codec hardware found in the Eliza SoC. The iris
> node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
> GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
> codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
> support.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

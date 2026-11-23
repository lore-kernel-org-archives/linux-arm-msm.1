Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440906;
	b=bgg4jPQgcs9MuO3ZstkU3p2uthFWj0W6KjeQYznoScUAT/R2+76EplEWVhAoOh8jBNU6
	 YXrCsz/HBHZMnqQXtHKN2f0VnO+pMg5vW0OUhJvGON0fYSHD2p3vJkjtm8w33Vdh20wyk
	 LEsLdZr/+xpvtgiWBQjrQ9tOMrS2ntm9nQPLP0A1PX2nPkn8QUmRxtQzp5jnuVsjBKsi4
	 EOvoR+EXyhil4dJKq2GSKlrQ//kpn3goY7dVAsLaUffgYSinFKzV025KycCBWzDYmHxno
	 8+pRyOyZjAJQm5RtKZqceQO67t5seZNQ2Kj64N7ki3KRuTRWtAWH5hPcrhCPgDkaQVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
	b=pC1pxw0oi3YOyMKURHhVx3pwOGF3YaGx1QbpZgp5tDboa9Dyps3ppb+GMO0DNR84Nl/C
	 fFoDa5pw1MFV7/lXExicBJnl4z0j+RytD0vGrZV9C2dJw5eMxKU67boLY0xNI2bQfho/e
	 caE7zSsaHo0SPvn0fAv9ei+SV1Fsvnu98epZPkL0abctH0clMtMeQQg5+FJcdBbjF7LiO
	 iJHdVBKN+wcua4gcO/0ulu1qUA3kOxzHGKLdhBWEZjZ+a1M6m1/fUfifWyptBMydx3QNe
	 d7NC+viLqIyNyHMirjjbot12KvEJGY7P3fvITmzH8QmzvKJIdqGwfIrd4gDIyf6/71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEFaZBcv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhkGzK6B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38C3606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VEFaZBcv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hhkGzK6B
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKscJ693816
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W4X+lIkpMnuBPXB5cEtedMsQ
	lEel+NCp6hl7V/xtT3s=; b=VEFaZBcv6QGdGPm6O/xtuaSamAgwZMZvMl+7bE4H
	kMgAoM+nduS1Hxg0u3aC/Q3I4DawmUMY4gcm5indKy0X9c9vHvhenmPBCv2DMUMz
	yc2nPqgCe2QiA5lUXX7+eO8cad3MVuxjebjLtvafW9YoMz0kGBuERs8N/Jfin4bq
	gNbxlU2t1K6GypHjoywh11oJBj4AZxiIhPCAvnjNX4yUgSfT3JiXW5zTLYTu/oGw
	jEz0eL4k0C9AQXQqy43GriIh4PWHvisZEAjof5aTNIjRMS6KyqFVP4qritTfFctp
	KWzeXnAPVlTVpEVd6S4iZY68WHVGz/sesr6gdTh7ZSxRHw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0rg4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:35:05 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b51464f007so44057287b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795440904; x=1796045704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
        b=hhkGzK6BXsmbaSYX5+Hcbi4s7pZ7AMQf8v6TJ/i9eXk9UMOkZIBM5Grj4hT6RQkBk7
         PRmzol2EC1MFVdKgwb3Qq+FPN3Yoaqst6q9YFW/Z1nF6nAlcT2K3Jkso6h737AyD/qzj
         uMz+MGtVx+8L/RXYHxySu5EKZ700RXpSj8rgLEVk4iXf9CDuxKYi+Rtl5sFwq9VjptO7
         DE4TSuDWeq8nsLNWqb7SiQvh2SOeZPPkR6eDV+7s7rJAsKcHPOITt8kjjQFFdN0ltNWq
         MJaOO/gWhYiE9OOYfAdm8YDH5TxE+b21vHzHQTDBssVPdvewinN9LbbnNFq2j/YesU6/
         ppiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440904; x=1796045704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4X+lIkpMnuBPXB5cEtedMsQlEel+NCp6hl7V/xtT3s=;
        b=MeNi/K1H+ob/KIynP5YO8qkWkSD3qTnGWsgF7hocAvkFUFDsxzWeXfrvuNuN9mtlXD
         y9b/2898rAEEe1AflRNt6J0YsRTKddEv6bWSbCP04C7Um6xSv7ccUoh6cGZqhw/6pSU7
         adjvHGltIKmW/mdmCJj/yvBJniAHCI3b4hx467sQ/bmSjiEf3GVCLrjXsuq1fF/+oQJE
         BhTXSqpZIYXxWYGsu7CEFCz5d8UZAC6OhorQnEQCDiaRhQRpZfHGeYuXgG6hcfpuRF9B
         kTQIoddXPRbIct+VKDnqdxQ5i2QWMS7wBH9hke4J8LdtLC22MheoMfwZXUnuyGesIqis
         zcWg==
X-Forwarded-Encrypted: i=1; AL+hErHqhxGr7ufa7v2ZpTVrbqjmPhtG80LUKq+wGkIvwdWBUXt31XekGDe9gR5gntzT3c2uzV4mJTgKbc0XTFu4@vger.kernel.org
X-Gm-Message-State: APuU4Z/myKZFvqD/slfwVohZtiAehZiIamIXc/RuV2TwSCVZU6EWLljc
	OkiBcjE1WTMuN1XjobaL2P0774mj3KEO5Du0m3zbc4NP1ibo2QrUzdvDjGBERfbZe8Ir+fjHfFL
	joYdCC7gF9xjJ131zf/3ZHJeXqa2k6U3g9pUCLLqQ9gA1QDj7p6J8yoMDs1XQP6OC4mpl
X-Gm-Gg: AZFdTZdqbdFXMP7Z2dKis23T4xd7gMlnFT1hKxmnclB5O5NTCzZWte6TUaW85B/REPi
	FV54qbxtzhlbRQ8rwGPTUzb6IzUDCpW9kUqLEqQckNUfcZtXyOMcSXxyuklppx4X/h+6lW/DT20
	drvsC+TPoSKJkdf77CYy3Maq/GwW/+F8BKdJF7fmG/Yn3ZpSxrTqtcsmYM6WCh7B2EaG5/MIloa
	AAUKH/NQ+l/M2pwOAB1H58FaH/bDACAVYDL/gUHl0aX4FQPiWyuloohuclHHLOv4ExJXg+0zv4O
	/9E5K5yCDPY3+42snOVISZAUOjSnQgVTcCddQctK+El1qB/SEb9RbLPqm4TDIoa7t4rX1kz3Adm
	3CJsE9DlOtlBnILeIAscDY2SppyAfY6+W5MMFwDUTed31h3LnqOuSjhcPbdOSCdXnaphTEu0FYv
	0MoZZkKotun+EYqJzZ
X-Received: by 2002:a05:690c:2a44:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b52042bedamr39514747b3.10.1795440904407;
        Mon, 23 Nov 2026 05:35:04 -0800 (PST)
X-Received: by 2002:a05:690c:2a44:b0:8b2:edac:7a4c with SMTP id 00721157ae682-8b52042bedamr39514537b3.10.1795440903970;
        Mon, 23 Nov 2026 05:35:03 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52030df7bsm46300587b3.31.2026.11.23.05.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:35:03 -0800 (PST)
Date: Mon, 23 Nov 2026 21:34:54 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
Message-ID: <awRA_lWAviFJj7oC@QCOM-aGQu4IUr3Y>
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
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
In-Reply-To: <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
X-Proofpoint-GUID: muUtc9i88fn2SK8tl_baeLDfj-dwyS0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX6EKSmoiKe0EA
 f4wV2DT4k2sMEyAThRdlEZn2J/Y0P0HMkRdlgeKSL7X9lYhDkUBk4OJlz68YtdbPNPclHzbDDmS
 uYp4QVRcMkKDIFpzmGHpB4IeuqUSFCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1MyBTYWx0ZWRfX+3kfFla0Y5SL
 JBRiqoVTBXGIhJR3ixHtyv9d/Zr7EITupZFpOhskv2fmWfKLW6dM24EoJ1bC9VhieBBAISNC90A
 /uGgITJfGm3yNsVZgnNiiDrVDwWMj6+VFfwA0vTxRVT0f6QmjgvvVd72LeDcZBv6A/B6AKzrz6B
 m3zdc6Ea0wrIJuz4f1vrr/RFxYN1I3cJPPpArEhMQ1vyPiynhn7dXeomDE2RxqlTQKyMreHc+Pf
 9SIxHkURx/zmulM3tOrPxnTUp3dFs+G7mGHxIpik+kh583w7NxeTVQlP9/0otv+lSoilnt7BTmn
 3eIITIlnE7UAElJ9J3g0MSWzygGHjEelcplaSahMmBm18Xqug9iqqvEP6HYUsPK+FFE+945M5DH
 RnAhNTZ13Zbuz1jbG8pCaxOaFUd0fiiTjYLLz29FU5/K2ujZgqJx1QimD24L/ulwD6eqSYRe7bf
 9CwiZtw9/AzuJHs1qFQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b044109 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JVp1Gilkp8drtUWwDXwA:9 a=CjuIK1q_8ugA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: muUtc9i88fn2SK8tl_baeLDfj-dwyS0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230053

On Sun, Nov 22, 2026 at 06:46:21PM +0100, Krzysztof Kozlowski wrote:
> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
> currently used only in the socinfo.c driver.  There should no and there

Same typo as in patch 1.

> is no in-tree DTS user of these, so none of these constants are really
> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
> that part matches the concept behind DT bindings.
> 
> Driver have local copy of these defines, thus these can be dropped.

Nit: Drivers have local copies ...

Shawn

> This has no impact on in-tree ABI, but any outside users would be
> affected.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

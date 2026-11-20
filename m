Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163946;
	b=P4j0tI5dkpgAqbDrAfRQy524iG7eGmm+zrg7UhFn4DMEF92yPq0COP1gmg7Taevo+jX6
	 jMmmJKhlBTKjyQNOyscUVGiWn+fk+37raMaNoP7Eml4IYO0UK3jgO0jkdg3+Q8dIu/Opu
	 +GMtkuj2rSk4iI9DPEq0jDtKmroe5bgsY3NUkHDzVHh9E4X6L7AGR/B6BaOHaUMlEi5gH
	 QI8FvLUhA4uYLV4DuGFqDW0em3Zd+0XfbS6WV8yo6jtLLbBreRz0+RdAX8hGbyurZjndW
	 uO61zQJ/JdJMaItVVdHhOC1CjbVhFuVmukKg0RkQdFnRVXOUI7So1cg881euqb3KP/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
	b=3iBGRJWHVQUtd0hUCHavG8IKEnOwYYYyINxBZRcWkjMF7owlUOY3J153NXBB9tOxXgyk
	 Me3bbfVkcS3ate8lDFlh+FVumeoWPiIy0VfOmAE0iJtp8bVuBiXmtDghj/qObuHogMeuq
	 kdOZT7+CKski9O4eNZLMMJ7x7S+KCOfxieocoIJRk9xqOq8UJ3n1pFej5JrJoJiIlIZxr
	 Mf0pz4STtxQfIVPbzBCp7tPwDBi1w2jhMh2iTpmBEB6ae/dAGN9HY4q0kIUPTesmWqSzM
	 6usOaPXi3f6zRzE0Ek3UG8ztR5k1NCUFaLPQ8fqA5R+LR4ZFpLcqxTivpVyrvOzWfew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="V7pGQ2/J";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyqNdjXS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA13B606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA13B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V7pGQ2/J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyqNdjXS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eufq3575623
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxL85Sxg8r+S5/kdCqyPgvf0
	BRmAuv9WK9TtBPMBZAg=; b=V7pGQ2/JE6UEEFVms/VQyMr1yIr4KBvqGydNk7Lo
	osuwTK2rJfPMGognUWHWpsW51HucPpOZqgSw7Jry4gJ88uEPfwuocpeKuXcO2u6q
	kQfm9Iu6Z8lqKdaMENXN4Iv3qlbDRjsEPMouIXMs0qfaW97BgBBeOmpo7vfhspaj
	pT+0rWiCg2KWkQPFchTX5uqz4L/QRQO5Tt1CRgXEdE0xwl7/v+uEAib6+kyQ4DmZ
	PDCASnJjtHbKC+7M57rg44StUzwgNzdcazpaSjKmKwR8+Fy3xkzT1/OAOhRYe21e
	25r9GrwGbDjMM1+N3WsKI0eHnkckQyR4IhoaRj1J4MzHFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80ha5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:39:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131befso118154385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163944; x=1795768744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
        b=DyqNdjXSXOyLSSixmqOwLoBayQAE5IqBE5WmBQZcTDi6wXOBMvvR5WMKLa5yFfeuc5
         6OdObj2odidxSYMfqxAjkoMlFX4fhXjL2MDNm63POKWJb6Q19ltejx3fqA1aPfQV73Aq
         5DQkG5cNzH/0bcEo76ZSmwRQjnjY7LkBascbl2xzHIBei7Y2YFGSDDfoAwq/nVPDjXqH
         Lz2uRLx8QVs9QJz6iQ5bkQBmjxKORzlJuE4Hvu5u0erVEjUgAc/mfWOKmN2qFAGRZjkK
         +j2pzVZU+EDe/VaGuioMmcC+KYk2Lo9JHqfClET3Jc3In9uv4/QXZPkZLdL0Y0vTqpG+
         8KaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163944; x=1795768744;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxL85Sxg8r+S5/kdCqyPgvf0BRmAuv9WK9TtBPMBZAg=;
        b=VRakMiH31kATkWNG1XwfxNgRYNSG9G1l4RbCdvaxBDjQyB+amFMPHZ6XSS6A6jkjrP
         Jkwz2gDde2ALZPNMZPvbBKsgm3RHbBAAfzunLS/j54PEzTb3wT0moPLN11BZNYcL1DKT
         1AqbRyAoZX0RXjHsc0CnuwCZGnwugcscuAWZKVYrsZ5V3N6Z21fRLjG0/ro6D9fxsfqu
         UQ5WMtrqM4/3okSrzmR+SU3R4xXtulH2VsOlHV8x6XMWUEptXaJvAkEx/KVN9UMq42aV
         Jxckz2/yZluJ9frb2E7K55rARNJZ0wygi6bqoiUS5lfzW3z2gDTO35IN9n0h75fslkFy
         Dq0Q==
X-Forwarded-Encrypted: i=1; AL+hErEdF9kHohqa90ul+5Z7cQ0MuEUZGhIJuGFVKmiyNY8o3LYpyHt+IlGuK3NS2fsd9aM7IC95ZB0ETL4lQvUL@vger.kernel.org
X-Gm-Message-State: APuU4Z8a8YGz9AZkIdBZ3uq0dm96yLHPlOvqb0ebI8WLL227sxzpS97f
	JLsBUq6cwg8aS5kgAsJp9ZNI8uKTmSbLTgyM+FomfTkU7IkbLRfpIijDv70y2iRkfaV2T2Ua9sQ
	UfYF9uMReLlTc58nOfWAf6SpOMo2bBiX51/QqWBVbKU/QBq4ZvcuKqBRzrS6RytVp15yh
X-Gm-Gg: AYBFou2g057sPUBTGGyweOlEmSgCt4MGDefvy3ll4HfpRvfOrscc6NGJ+nWrZxpz03S
	U2cAYt2B4jE9YTlrzYrMvQdR4qeAsYQGkxNcp48YNzXu9bXfLdXr4bfR2WnAuFCetTm6QEOKmIR
	UmMwo2AYuDWeVQKjEKiEdA4pL742ysBuoyru5SDFNxP+1eqd96yZ1ehmcbW0YVSQWdT+Ibmvbrs
	AMtmMQjwK8nLu0RWmrKZqSUegjjq8PLG6nqQeyOETZH4ZQMeI+TkKwzGSkC3DCfn8AfGn8cd0PU
	bDs+t01CyPiay5mqqDQbNfeldKhhu7MJJ9WNXcl888eQGPTjziWh9s10rmsHhe+ltx3CGhDIzM4
	Pzax6FxjrtqXiYeCGcRwKMN52tsTc2nO+F9PV4OEd7uDj8zlsWbCLOdjuVpxHzn4z
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr379042085a.7.1795163944076;
        Fri, 20 Nov 2026 00:39:04 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:93e:acdd:acd9 with SMTP id af79cd13be357-949ba7e227amr379038385a.7.1795163943488;
        Fri, 20 Nov 2026 00:39:03 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm4317185f8f.6.2026.11.20.00.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:39:02 -0800 (PST)
Date: Fri, 20 Nov 2026 10:39:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh@kernel.org>, Leo Yan <leo.yan@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] arm64: dts: qcom: kaanapali: add periphid for
 traceNoC
Message-ID: <pwsze5zu4j6qplgtncsgohy6x77tomyl3zavjn43jmpkszrunq@p7et6xg6zqhf>
References: <20261118-fix-tracenoc-probe-v1-0-0298dc5f05ac@oss.qualcomm.com>
 <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
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
In-Reply-To: <20261118-fix-tracenoc-probe-v1-2-0298dc5f05ac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX1T6YaWSDCUXN
 DQpcmUf2v+Z9xMJXD2Djb5EzSWd75Iq8cQfjUJKpFvqj78KR3VCRTBszCOuj4NVhz4vlkFjhZCz
 z819J25FzB7FuV2Zgl2AZ5svSuJO7YnovrEfAVexekk9ZPsw768doZ9E5ZMWXEn3N/WvNiu/PJp
 tmzHVYJJVjS3lnrN0nOvIekvQ7UgOI7pmb0NmvIh7hIEGETximCYXqG36hlKpFbd/LOw9HBKlDz
 eKNTgFLV9+2gJF4J8+2BVcass5ZXGJE6dRnXLSJWLA1JxCSkSgOm39RO3dsBZAKcVlca2gvV5ya
 fUb/le/6n2cw85LQ+1fyaUFtPbYbK9Gly8P+YJFBJ5YuYDvekGAi8cozs/EzgyrWzvrRbmUClEd
 EK9VpIHu98TYzr3dl9TKqgusNz/IesmFHWVX/BpKwjQYTbm9rxWLTZn5eahpd9hsOGP+58w7fkV
 95GrtNDVmBfggG2c6Ng==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000729 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WMmcwxbHwbnGiJZfeH4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Sqhn8Skpr2-EgURbhZcWpwz5aTJQmVtg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX0RkXl8Jam5NP
 aIS9ZjpfafbHVw1WNFNSsmTRtEempxHvhx62x4FVBoLcNsFMLb4YekXQAZ+GxIynKIoBPZrmVg/
 a/otoUpTneCYXRCwWAHX5+BZ/RxIuWs=
X-Proofpoint-GUID: Sqhn8Skpr2-EgURbhZcWpwz5aTJQmVtg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

On 26-11-18 15:01:44, Jie Gan wrote:
> The traceNoC node uses the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The Component ID returned by the hardware is 0x00000000
> instead of a valid AMBA Component ID, so the AMBA probe fails and the
> device is left stuck in deferred probe indefinitely.
> 
> Add the "arm,primecell-periphid" property so the AMBA bus uses the
> specified peripheral ID instead of reading it from the device, which
> allows the traceNoC to probe on this hardware.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

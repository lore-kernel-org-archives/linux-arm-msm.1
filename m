Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1033E0082
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 07:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913221; cv=none; b=hZm4WBO4OJkGpo9ZhJ6MogNaM3m0zmVJdcNSFvPiEmAKWkX1V6j3P1cJxUAGrvpJLOSfSqVvScvig8+68EbT8kQg5VVvpYEQCMsZP2xL8/Ommknx+stVH5qv9KB8egOJpoHPTUk4eifFmbjtVzgfEUigkLveOvL4ZZRBTk4Y6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913221; c=relaxed/simple;
	bh=/+FOxHqzLhnZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INc6d2LjDHJRBMsNZR9ie5DlRyn8Y7MW+if3kVjzH1CvE6Ab8JrSujMKXWMsRrEZxDSQu0nPs8v/6mz8VZjYEt0A3mnAWn+90L/t6+fiF4+GkJRIp6++mTV/87CHceL3bNo1lbKkEZ8bOYveFmzrCliAuKsPI3tKt+eBf8/kIYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOUv9V3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJkDEMoa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOUv9V3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJkDEMoa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755lE4x2074244
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 07:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/+FOxHqzLhn
	ZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=; b=JOUv9V3YMDmsIGe12gJZbto2dhJ
	+O/6dRH9AW/Qv7lTNsUaAkYI87RbLcXjIo7zzG4RaKEo7/Yzvxp9gbigdrlZXZ0o
	r1rtYsqCIn58Nx7sjGWTY63I75V1OW5d3b2GUcOiUYNuuNdIBBMLhaUyUOcvvYSY
	3nPqkJvf4xBX+xaMKN8c1GSUR2lNgPLCarboLy1A3lfBGMVqtX68F+Q9w4Hzc/Xt
	4NTockKP+DdRXyzb1Nh9GuGAr+th1UPM3to8wYjZW/Rb7SYgtNcnC3dUPnGGb3PL
	wxwBRWiRkvO6BfbxwvUGmq2exgfUCrw+ESd0BAn49PW/QGrGLqdW5cbSkvw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum56k6jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 07:00:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso2383718b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 00:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785913218; x=1786518018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+FOxHqzLhnZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=;
        b=YJkDEMoa2o1f/x7k8QSgCe9ObYlG2VHQ1FUBHYv/GNBtYIGrSFYg+heZbP0WXmx5Lv
         8bJAioCnk7umwjkmDvQx6ZRJpo47iCSKzt1KcrBJ/PHSxuJRWIAzUeKqNPlg0ZNoy55p
         49XHKcdgVPTQ8IC4alNJr7zGLyq7bVIwkX9qV2Ry/NpiT9xqhDgmNBqM9HZmVWvrXMZ2
         ZZv4QInDzX72nzZ1UJ3lY1GeS5cOM1qZL8hVmkq18O5ZHBrZ0wex4kv9LsUqdhQWSqcC
         sJI8Ke4tqblUffxLqEtZXiZTghecqG+XNyK+p43WftrXpVEqXZjh4PavAgWy1pghhHwt
         SX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913218; x=1786518018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+FOxHqzLhnZgVQCoXHr4rbNk1+4f2oREAyt3WhnnxA=;
        b=Dmr24kz2nEWdUyLVsYTsWoFNIzons+Fzy5C9O9M6N/7qqNg9XZZrMtS8KvP4c3ZIPA
         IM25qlKrFCxgCBbX/Ls0QsB66aWDQQyCteMbFLkQC+igHM5vhqjsVmH5hElQ7SRpqEW7
         dU1QcNPiXQOCJoFKiYcrYURQhKev1KmrcFMwIbaAHjjXudkCLpIlWf45asFIJBQFhznr
         QvwupR8dCOlTh9Ra47Pf/CeA08Solaod0zWug7Bcn4xdLUwQFhJn9sku8k8c6S1fhNiY
         sPc+q/jiYR2tSbKGjQf+xn3NvHu6kmla3GDTHzBeaVB80dXgtpTuHMIs9ZoWSGf4qawo
         2ODA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9uvmnobJua9vXsKylPfdyVDvXQipEkbxCuO4FuX/a4laTFnjwIRKSeno0wT3PS1QgZUvz4dnPF60Q6orG@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMkatEujSHkZvkNsoMCkaxGl7HJ4mUMZIMAKm65KvqAgPpX87
	ShjvYGN3dpdyQfasFExt+op7acO1yxzADekR4/HZYYZvkwrHoOqstCtvaf5WzVgl5kqd/Q24sKd
	tjQbH8PA15pKp9gL7/voLIRR8uKjhsBUEfnOGIptYW/H66UKYMjakQGIHVk+uR50YDunR
X-Gm-Gg: AR+sD13OsMuibQZ3U0r2kS6DrjXT2ab8WT1zGAg0nu3+le29tRB9tPs5gB3PoYCfQ8c
	583WZOIArbZpIikbfkmVxXXqfnG4v8zy2sb4SyFT5ZAsEK38fKGAmjh7Suw3fpMOWknW4ur2LyL
	bHjcEpyYT/1z+0NiM3ouhBydOiDE5OGN/aSzymu7PRgu6iwI2HF6ZVDLF3tQLHb6YeC6aYExxWK
	JIJFY8xysSli7hfiXOU8pBQYlhZPk2mp+i1JqjPo4z/hM29HQlX/d07Z/63GrdVsCQonUuiuEOo
	cExO0UlGn+NrpxwJWCI+S+icYJugDiZhTzdIbxfTAy0sbCMlV1UVLSsZTZ1DRwCBkEPfRIXSEF4
	XXMCBTNDsMDbwZLxVMnLO70GMbjsPzGO6Dy18h5t2ScY5i5vgxQPdhC394m8Pf107xlD7bOA8oT
	x+8bHFPVE=
X-Received: by 2002:a05:6a00:418c:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-84f1ca72e94mr8994139b3a.5.1785913217700;
        Wed, 05 Aug 2026 00:00:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:418c:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-84f1ca72e94mr8993965b3a.5.1785913217018;
        Wed, 05 Aug 2026 00:00:17 -0700 (PDT)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e5139casm494617b3a.44.2026.08.05.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:00:16 -0700 (PDT)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, brgl@kernel.org, deepti.jaggi@oss.qualcomm.com,
        shengchao.guo@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Wed,  5 Aug 2026 12:30:11 +0530
Message-ID: <20260805070011.2921900-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729010022.875799-6-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-6-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t-1RW87bVoLPUlsYlGVIRsJhXI8Lc4yF
X-Authority-Analysis: v=2.4 cv=Co+PtH4D c=1 sm=1 tr=0 ts=6a72df82 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=a6JBoq2n6Cm8xmjqUjEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA1MyBTYWx0ZWRfXzY8hekLhhxJC
 bXsEka130U+ZMohOiVIvf3WMz/vinI4TL8/DPpj+sU5hf2tFsb10BxCjWcY0yu70bAQVAFXfdYi
 cyWhl41wrjzh49RU1QlfST1v/REA278=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA1MyBTYWx0ZWRfX3L9vDD4YB86n
 fLNKnyNZdVfqVudxg0wOH7Pa1RDyLftBrd3XhlLL/PgKSFkwlh0puBgm01pre3fGGuEI2oD+VWE
 oINzPTal83D9jaUSC7uSbwLzE+rmOivBPLuAiwuVg7St8vnle4RYJtKRR0puzdlDxGTU0LVDT3x
 n9fMM81rHOWlCWaXXVZPoT8mtZSlup+Z3tv0Ee8VaR3j0Zq+3fYZpq3TZT2YoLJUsFdPEidj6IG
 IE0r5FSaMogAMk0muywBwcbz6Kh9gXCxb4aBZgxJs7of+7a/Jvu+zGrNdZyB7//Px0d9vcVZmZY
 7XMQmE8HJGfN0FkBfTMyJxjE/MuTpoO1LtbhZwY76X9Ggo8XSbAz5zJlmXMfgqZXcwiZOMHvWCY
 q7klj4ntCOr3DpLW5D1IDdmRH6AdQSAlXDLeZRrzefrklqtSofuG3EZRnM2BoIqlACCfSs9ZFv0
 XpXvqZOfBYfoNU7NcwA==
X-Proofpoint-GUID: t-1RW87bVoLPUlsYlGVIRsJhXI8Lc4yF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050053

Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>

Tested boot on Nord Ride SX platform.

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9D23806CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701115; cv=none; b=oieBU+N0u8VuQ/rpvvaeHNwbGwbH3MgiuGmKnimRL6vRZYGUS/pZFRA2DYN0+SbH9THSAk4lgggSFeNxAs03nwOAlTsJbpjiNbwCI3LQBee9mFqZNlY5FOF62UxB8sB29cMuygcm+BpcVJ21x0tRoLAFbrKCuduiW34U0ecWQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701115; c=relaxed/simple;
	bh=9rCY0trFA5vvumUrpeAIJy22vaSMb6byDQ3hW5wJ+es=;
	h=Message-ID:From:Subject:Date:MIME-Version:Content-Type:To:Cc; b=dITEX+S/fxbzyKXxTPoYAvYUNm9nH8rZgB8hluLbCNtKK8JncE+fE8XXuTGHqFICxwOBFXloP78sZj2hQk6N+z1tubaxOHR4sBHTpSQUAP62HnsEzoCX095tDtSlSZo7XNM1ErbldKqPngJuVq3SPRv20riwiLF9dUofdffreEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDFo2YrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsN9xFYr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDFo2YrJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsN9xFYr"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7ftBO939326
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dl/4pbaUh/02l4hy7pirGK
	zvjFEIIv/7H/wV3RxjyzU=; b=CDFo2YrJTinwybENcklTQ2Nf5af7qV8ODazl7t
	GxFWARuW5NPibZI+YuLiqNYr9UaiEjDeui5UskwsLRuo4dhMdETqXGpbSDYiQagY
	SNB953WS1rR0LoAb6Ue5a0nSqfx6Omx+JYfW5Ut/yxmS/LGUuw0XDrMPtRCq/sDn
	/CRBZ9zOkPWERaB2HKst9Nefl8qMPTqcU72AhkRK1ddkrLwSzAytzk+pMrV481Z8
	Clnc5xRrgvgR/2jR8jQXLlS7pIK7x/7ogaJfnu4CDx8hLsbKcjgSbyYUR3LETGs5
	LVCDaKNlX62oC7CNwYAHkcJYSvygcFHcZAwIRfUpTkc62y9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3vbw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 09:51:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so1649141a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 02:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786701108; x=1787305908; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version:date
         :subject:from:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dl/4pbaUh/02l4hy7pirGKzvjFEIIv/7H/wV3RxjyzU=;
        b=CsN9xFYrA20ex4RuzvUz9J6vJBYyEDHJS0exjx52w9brE/LvOj+9hT0uXlK0685l78
         QaENd5dZuyGAHlbjfLTbfhc27ONul2tmz3tzD5Sg+iO+otDF3HYLPZYvkVSptS2SfblZ
         4aoOzKKNqMmHR6a7kujWxnkKfISQ8ND1nqC0+/WBZ7VOv3t0XM9wef9B0E7mS5t9UGjH
         M90yKzm6XMQK0XazWn9U1890AMM3QRCTGzeqwns3bFoMdtdjvELUzgdNcPOOaOn7m9L8
         WZel3OMPNe9HEjqGgvN+Q5NtvJzLQEQqDu2Ko7tH/GVuoJOxKsBrcJfBhQxxtcCoPt4A
         D6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786701108; x=1787305908;
        h=cc:to:content-transfer-encoding:content-type:mime-version:date
         :subject:from:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dl/4pbaUh/02l4hy7pirGKzvjFEIIv/7H/wV3RxjyzU=;
        b=moGHEIW6c8m81S97uMh6hFq+X/Y7T+41WvRTBjn4cgT4TDoUKM5DhSOfu9ViBGIn5a
         RRgX1fKTG+9AmlfEpi3UJkiZsWlj8xUtan/0F0WzMXUq6CaRINpLofae6kIPgVI+plFP
         YbONKXV25YBvl/QTu/N1P+ppDEIYRq8fZrY887y4yBQRSPmd0L6iLYMWVsDliIIanleh
         CNxNlcNhPkdQWe24PtqUcR+M9waMiS/wnNBBgdYSSXi8sWHzbuk2Ik19ghFr2cUSAq70
         6ZCQEWJKTMW+swmhkBSv7gSvRCik66VxmTmmxtr2VjoPl+IyYIOnjt32oyRudb5oIX9d
         Cg7g==
X-Forwarded-Encrypted: i=1; AHgh+Rp5tAHxjX1mG48OALheLcrU95We4B3J8HmJBYeyElRxkuiwoGGKxFZHp8jx4LcCsAQozLm2bNpPis7tK2Ah@vger.kernel.org
X-Gm-Message-State: AOJu0YyKkaDnstswVLVksOr/jGjMKF4p/2YhmyRniplmOvQ4xTSz/LMG
	KcbigzGjw11gBiQT9gkM9HVgPMK5oKBmL+m3YHRL1Rvoo8uvUPuKzmw08A4DitIDZpnoy2O+vWc
	G1UOgGwPkF0YyO2gdaw6pibQ3GqxilEexBH/qD7Xu77l2zO7NgcWdKp1a6fzHJbYeA3NHZu7Ye5
	n2
X-Gm-Gg: AR+sD116pYnqEgWeH9+ax3LoySO1FFCxOWHP/C9oKKy4lRIfiBwvKWC/LIom7d9nvi+
	V4qQVAhBVUEn9mC9e+nWeZgkAPdpa5bCUQhH98fMVfbXJME7wvXZWOkz8ZtpbU4GTbrRzJUI35v
	9QAY1uvBA5gu8dMpkfiW28uW9ZPQllb1a/KzEXdNkfMu34xfU5CnlSYYVXDo+FwF7wWp76u42We
	6jyWCpToUlVtkZ/ThbtgIsekrVol64XqDnq2AhFifBJ7g0/ZfmZerl2hYaEbVaI+eYwnS/4Njzu
	T1tEmf31k3On+TZ3FMuXz9IBglyrUYlHX56Q44CfBUK1W1EM1oSf6LZ8rM+VCJkdL/3C4GKn+wP
	nB/Qp5oeMneQy/MRfM5nRwLEadTphn1DG
X-Received: by 2002:a17:90b:5745:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3933b7a6986mr5464544a91.8.1786701108135;
        Fri, 14 Aug 2026 02:51:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5745:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-3933b7a6986mr5464489a91.8.1786701107711;
        Fri, 14 Aug 2026 02:51:47 -0700 (PDT)
Received: from hu-sachgupt-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea995222sm2073160a91.6.2026.08.14.02.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 02:51:45 -0700 (PDT)
Message-ID: <6a7ee531.797536ea.65c65.2705@mx.google.com>
From: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: [PATCH 0/2] arm64: qcom: Add Qualcomm MBG thermal monitor support
Date: Fri, 14 Aug 2026 15:21:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzlfmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC0Nj3dykdN2UEl0zQ4OkJAuTZBMD02QloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AzeaaMGoAAAA=
X-Change-ID: 20260813-mbg-dt-610bb84c405c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Gupta <sachin.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ee535 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JjNNOwtxx9JVdBgQG04A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA3NCBTYWx0ZWRfX5ME67GlWHGVG
 5DRoEWHXoJxELbM43LvrY5oZ+bXApMWLY3oiQuRmUZYSe5Dbdu45eR0HfDd1+dLHbaUep01v14n
 Gilvi/177rDIfUZqqOcuZ7IdhtnQnvuBXhVazSkNEScky+IBob+DhLPBDvRmWLOGaaMHPBrGcw5
 ljDxU/0vO3MZmE34mVuXXc2Uos4HWdREJXGxCc5/CEv03fxHj/JDiyc8CqXZNKn8DVomoOmqLLd
 Imb4cQ6bjHjcDBL8juAx36GRSnCVt6ZTtOV2xhy2tbHPQaNiPqbMnYpVaZ7nJbhm3eZ8hdkuNbF
 PtSwmKaJRRoBBTpYpj0I1bbdLeZ+X4MklSg9ekcABzZnhBBoCUm/Uc1vHxuDRcJd/uGcmOuyO1V
 cO2AmoDQ/0nn0z9rPvVvld73tcj3M4GzYA+6DzLWSX5rjytbcrdH/6iiDxUMejItZwjha2z79gd
 GXrWE+58leuFXxlk24g==
X-Proofpoint-ORIG-GUID: qQvBlqL6BgXaPZvspFuaSOKUiV4s_59X
X-Proofpoint-GUID: qQvBlqL6BgXaPZvspFuaSOKUiV4s_59X
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA3NCBTYWx0ZWRfX3hPMTCkYIMwD
 fRz3VPW6qRf2hKUwzTNyQ2RbQqlpft1MNk5YB2nAD4pnH/BVlhmumxw7y064zMKdCTFNybvCFlb
 0YvgomJAYWGb8DbVmKy55uergPBsHRI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140074

This series adds support for the Qualcomm MBG (Master Bandgap) thermal
monitoring peripheral found on the PM8775 PMIC for Lemans and Monaco.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Sachin Gupta <sachin.gupta@oss.qualcomm.com>
---
Sachin Gupta (2):
      arm64: dts: qcom: lemans-pmics: Enable PMIC MBG thermal monitor
      arm64: dts: qcom: monaco-pmics: Enable PMIC MBG thermal monitor

 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 116 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi |  62 +++++++++++++++
 2 files changed, 178 insertions(+)
---
base-commit: 28d012efb4327f9c75d5e042a7c91e9a542efa98
change-id: 20260813-mbg-dt-610bb84c405c

Best regards,
--  
Sachin Gupta <sachin.gupta@oss.qualcomm.com>


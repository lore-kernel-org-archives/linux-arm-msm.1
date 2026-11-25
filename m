Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598535;
	b=nbI8xTcv2fG8V+MIRp9OTHYmMiXIjsqNCgVRxHkbxdiWnD685oZYo9tqiJEFY66D7h4a
	 M4wE0bbgyO1Zm5Ds7/jJxf9m26W3ipdo4QyF4vL7hWfFkspw7mGtcn0yaUbFcyRiRjGb5
	 1bVsbLygT+bGt4dQ9qvr3n+V7rxShh+idROmS1moqirImDLVbMv0mLilC2GWrkyn0m9xF
	 WJn339jEifKDb/1K9+PHi0mTXVywRoIrQdvnPD250d7tIuKKljyUBIKsjTiiPR1JkmqdU
	 v0AiReeWscPbQlV0ocwmVmtIV8zIUSxJqHnopUMUsozYB+Y243CYNDOTO6nhDcOUoDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TBFTW/HQCXoBIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=;
	b=QIA8YzrFfLo1+7fbuxyrAkYfibEjrVlZuUIAMfnGEuBtRcG23dQaoNi4C2HoYynr3pp5
	 pgdo+DrUxSXCZR4OsNWxeuYbNi+w0DsLS/OZoRd3/FjOExhSx1kkcst6D+5YzT2g+FTG9
	 m1bWJdDYEaWrOisj5UxfOmhuKjsXWZi6/lW0wM4UHKn9avpQYYQRtY80K1VkDmbR+/KMS
	 LVdsU6GOwwNDvIMH/FqOtFFwCIUstNEAO+CVh55hMTxY1WR9PxAfP7ExqBbUXwUqrraqD
	 Zgv7y+5l1NdcVNW/eF82026Etz33rCrhXnJRcm6noSFcms+nqsuF3ZutuAEYFy+jW4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ke0TwPlJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2zVKdL0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B794606A6A8
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B794606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ke0TwPlJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2zVKdL0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68q4j3807995
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TBFTW/HQCXo
	BIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=; b=Ke0TwPlJj6ayq6TKFkj8TaemFBY
	2SlrXPF5I1S2hJI8ohxy4EKlu77aALwJJJHoPoQvaE1z3y9aH5pHgCtiwMPYuYNm
	2pg+pM8CM/Up9EZfk1UF9t2mqNo7IMHLkThLI8u/pEZLdjrIoWylzDJkqjMh3W5z
	6b0yLVT02Lg7t5OybxonJl5BinG4bjSAZvaWzCWO0RPLXk0j0tORlrDmjcAQpZSg
	HhrWAaHH24L1LbToSSKyMVOC++IS8sM0k4P6vg/d4s3FuRP7JULvdoAmc8XrA11y
	8hAfKYNuVQ0QWDAYzfGNT8z0Gl9qJkveWCDyNwMgN6B068yQvq/eIJJVCeA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkc2k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:22:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efa9aea3c0so71934565ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795598534; x=1796203334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBFTW/HQCXoBIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=;
        b=W2zVKdL0thF8AS8+dGxkOTIstE8/R3rLoaMYkw2sX3iUdoLb1zayJl6hitUlthMV9s
         JBCJt3iQtZDz7/raGRhuo+qslPheJijpCiX5DZsvmeX2mY+UoXtV9fgyghXYJmNXfxIi
         d4ztxYhy9Ied+R8r8oIJIL08EyrwE2vRlsLHADWz6RI3lX5DoHdNK0cDADTL1dggrKZm
         9NEBeEyOxDDLnHvRMSAN2VrJI+u43+WodAkykyyZ1aQH6NPbtdHvD9oK/IhFiGhd80VL
         wVo3kJGHsSeGb3XkSfZcPYvgS4KAt1vRc9v7A63YpoMR+rABaD6Tf7UIgzcBJB6GvyIf
         ytLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598534; x=1796203334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBFTW/HQCXoBIwpfuLgEB6yzkQLMEDVKMLd/mF8Da/s=;
        b=jGYt6zQLIIuY/rx9S9qm2TPMYwOstea7zoA/yzCz1TDMxWHf72aMTbp11zum8/KoY1
         RLaoQXqN5iNin0dWYjgk8tOrDx9kJM/+8q9tu02WPn8yTNAtkxU31wa15LcFJwmVxeKz
         Q4zeCnr5gFJroH5viKrmcYcUpAHg5Pi3ZPGmL97xhy88zSsUYySNnXXEqia7YFHw6zVi
         1/pjWeKjRt1ZkZxkdUnFG0DR5or2DP5MhqBLEJ7H8TslAP3m+oDY0/jSwvIC4HjpX8WQ
         lh3v6AnYHlk/v4BgGXsm7wadOIgLErA1UQsCYgGEBgK2fm+ZhyZJS20KIDB/r8Yggn19
         6oBg==
X-Forwarded-Encrypted: i=1; AL+hErHCDHb+QDULom/M33bArpXxzm7y4IIbHOkqcNESeDqrQnHPyrQPG8rnOoL+Jg2RWVjh8+QRIha5aYJR92ed@vger.kernel.org
X-Gm-Message-State: APuU4Z++d+tFTgHRJoylp59vJLa4ZAowWpqxwMdFJqKDJeI7PPcy4F7R
	EnwSB7PYKQK9H73J2mDnr5rRreSBwQmvdqdef+8JCUtr86bpTHaKXJu4uOlnzDYd6FtBb6qVBgz
	oJY656oh8tpL4S+QmA5rOCt1aBR8SAsTES8fXgdFecCuAET/WCWKaZAiyJ1D0ICkS6mKW
X-Gm-Gg: AZFdTZfVXRjsNbkOyvN010u3nAYw5XfHLaZWPJnU7cbbw5aoDZLk4/a7HxEnbHuaHSl
	Q+Th//NQaxCSeBk8Wq06NMCS2mill2jYQA7tZ1PTKabe6oD8GJw9ws9EwafoRSmMMFmUzegaqeu
	bk9wXUWhfXB10iot7c6ZpmoPmWtBetSsZ+eXZmiip5dQqlwjS8JVJD8ym90s43ToCoKZH4BwN0Z
	Gt/PjYayxJv+G2TFacczchIyqRl5O4ofnC7lV0uYW1cMnYkq/fulHd1XxOyT5z0duJLS5dxiHso
	19rv6911pAtTdxv0kw2ARm9DU2eEi6ZdwnOKSZhnfYI47BlwlH/MAbhbKRA1EOZMsb+LET9sop3
	uo/ZmYeAI/JzBmsvyr1QHKEjyXIbye9uRx+w2eHwF3xxFdg78p+vWChi//UBClOqgJTExY3Dt3h
	HG3+DpOfbvd/QvGCs//095pfgXv3wnx3OAAhDwbdf2oOBiNHhR151TZaA=
X-Received: by 2002:a17:903:37cc:b0:2f0:4ebf:84e3 with SMTP id d9443c01a7336-2f04ebf86e9mr143722735ad.60.1795598533853;
        Wed, 25 Nov 2026 01:22:13 -0800 (PST)
X-Received: by 2002:a17:903:37cc:b0:2f0:4ebf:84e3 with SMTP id d9443c01a7336-2f04ebf86e9mr143722555ad.60.1795598533417;
        Wed, 25 Nov 2026 01:22:13 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm81538925ad.20.2026.11.25.01.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:22:13 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: qcom: geni-se-qup: Add compatible for Seca SoC
Date: Wed, 25 Nov 2026 14:52:04 +0530
Message-ID: <20261125092204.196196-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8407f7d3-94cc-4ee2-932b-7a46e9d195d8@kernel.org>
References: <6e09e1ce0d9250af78da72e464b7f99f942e1d7d.1795517657.git.yadu.mg@oss.qualcomm.com> <8407f7d3-94cc-4ee2-932b-7a46e9d195d8@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX/UbAfkd6rdw3
 S1Tg9JdRGa2w9TrObhpbukC9Boi9rwaQAAFbg5uCS9xzb6LNXZ0kNjqhgQkIIbc7pizrg/s0qmp
 xDrszmsOWiaBdA+I5pRQMcCgP7HwtF6XsH65rxIqGWq1ZMFRRs3CuOEU+2rtXl0MG7KLuzjONkR
 rZ3odWJDvcDQFRJS8D+5xjuBG2JJ976sw0vhGrSAVh/xqrcUlYFhRYS0/RrEnDqFjElWDnmXXTi
 0mu1vITw8cdQMF2uEthruBTJh3vZl/cOwxaTkJWVhAkuDo419bvHK3lY376P+MFLsKHorNuE6sV
 ZcY7G0TEsresbIBycQI0pj4mPmiovpXgeaYzK3lxethhx+NWipgIwP1kFwuvvP/dqZnQIcTaJwA
 iWWLjjJGxCee/NyfpQzEEve/ae4a3A64l/LE0oLf/ffs/dVdW6+WG9J0TuNKeA4psiAfOl9OP/+
 W0zFATI6rF7IrV11y+A==
X-Proofpoint-GUID: 1WUjxn2aqp523H05XE0LKWNilIMtegrW
X-Proofpoint-ORIG-GUID: 1WUjxn2aqp523H05XE0LKWNilIMtegrW
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06a8c6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=nWgBhYJttB65tbEiwHgA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNyBTYWx0ZWRfX+fA7FZ2OAGPY
 p1RtJHENRhkDwePoRtoWznDg0wLFC6VrfndKyBWZsR4IyorsvUl4c9GfKNG02OyaFD3WST4eXzc
 0l7qGTmVnpaKOob5ZicBKAZOF/he2/k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250037

On 24/11/2026 16:46, Krzysztof Kozlowski wrote:
> Why are you sending EVERY patch separately? Organize your work in proper
> subsystem-targetting patchsets. Internal docs explain it well.

Understood. v2 will be regrouped per subsystem tree: SCM and the QUP
wrapper together for the qcom tree, IPCC and CPUCP together for
mailbox, and one patchset for each of the remaining subsystems. The
DTS series will list them as dependencies.

Yadu

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602491;
	b=RbQ4aKChAVlTVyMeSsNlgOWJ9Du8EvrVbsT9skPGwuIsvBheyEpG/gUftHoi6qnblJcf
	 qmpR2F2bEP/93yJZO2Q9W7MoeGC48SLbalhV9JJXzGcW50yI1gunGxH9kIqiXgFdDlUGV
	 SSo8CHVUzRvCKB9z6bg3DVu/WRP3oUVztzmAuDLQvf+z9ddaDJomv5VFnne6N5eFEMsFz
	 ZVLIShsxt2PGaHso+pPoPoO8t4W5zXpxaEU0A91PRh70r7jtqg4WYodgy6hOTK9hF1EtH
	 bYwj9hS46UflymkKfJ1Xk9XDDOOhYCCwciudhn6dHmQyEDsH2mGDp+2pMs40PwE1dWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
	b=OgSMF5VtQgp5dIcKBTvlbairfEy87agranCdJj+sf6vygIgBpQ5xukPtCM8D0JC2DIfH
	 ovpGG6eObwQtQd8CUJLjZEqXmRn2vlAH0OnrUXL6N+CcdGJagQPhkkZhtejo1roVR2r40
	 3hKB3gs74TKcGqv/mUoMxAbYpB0AOoeFr//tzCCacKUaUn9ceRrGxpRwlxoBBioGJZ7I4
	 msOrobtWTShov9/tUKrD+p9o9cMmF02iF5SIomLb5XBMgWvNgUv46V0yvhEa4xM22LqZM
	 5M//T7gtAnszLZKxwwdHATA2Z5inipT+tei/6QoQvaG6vp7e6atACqL/ntQ3SW7+Fpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q6e71RUs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eshi3YxI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4C3606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 06:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C4C3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q6e71RUs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eshi3YxI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vIdO3324675
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 06:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=; b=Q6e71RUsA+cPp1qu
	5W+qAMMoZh1LZo+wuJH70y5+an+pbAguoY9PL99DpwF9FunJJyxL77jAFTdK0lFV
	xK7YMxYY8iAiQIEBa/n369Jijei9LlNPwMdTRkEP0A4IaTBGGuOTtSd+sNIHItni
	DwECJXTP9ZtNKh9nFhgCO/cfwTl2K1OJ0k8l0dnpyR2035D0PHSUPJkwkhL/YLgB
	egSMCKavRTNqxcz1uVXBBvIaRTbfLn2qPfdHHneMBnKpj+IN6Jgv7CobtiUxSh4r
	tuOUXKG3H21NfGBTiNiFAZ2X3JCjiWP8+6xP+zhzbYTIaUgjtYcdD5H1SLICFmBj
	62PRQg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6nput-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:54:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso2091889a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 22:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793602489; x=1794207289; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
        b=Eshi3YxIdKPLD0czPd2ij1XqaYXifnA76zKj+OzuZxn2Mx+H8XTszarH9lj4Oo25Ii
         kg5wHmwf8UtxHVdU5L0V9mg1twpUyjsg4kdctpmqAzce6iY2eRqHsuAtrgKIK09k1NCM
         36epSZjabPUu3FJSaSCvZ4l1fYHKY1c0lY9DKU6uBqbo9SdYy0L/EEr+AOGb5naH42ih
         P2NPNMb68NbXPZK05bBUZuw5TyFsFKU/uvVm30Pf49sAUWVSr3HRGYJ0rQbrTFjMnrH2
         J6kJIDTKxszt9Ar8YBZmo7ZKcXIviC6jwlicyPrfT18finkAMEi0bBUyyS0rJCU1Gfh8
         bQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793602489; x=1794207289;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
        b=PImOOyiksdk3R4o1a9mrqGH1G0G0yN+pwphxEEatX9xI7ymhMTRuXqxawP79HaKR3L
         0XWV3kR1FmBN+itv5zABQg/Gi0zFdqZlnh41lFp4+OMaX1dz8TW/iJRUaO4ydeUPANR9
         G8w5k5aqMk5Cm4Be7D7ytF4zA19KJwnwqGPhP/6ulrFvRkOT88SqkrYO15cfo5SHaqkl
         SEzrPbVGMEdy2Cl03PepSErrlz5+/OgGSYVUQNDGyjRApP2IrvcX+4f5eIL1HoM3Zllv
         cJinPYS1B7siN1UX5ABGnHmm6/fHfiJmDP6eDMaUeZKRfdhU3iQR9eRf53MKZ2XVSxoj
         XayQ==
X-Forwarded-Encrypted: i=1; AKwUvBweTH8yK77UI0LgY1CjPhvFdikCLGhSTLsgOsuEGlRzZxK5ZbK6QyZq0jc6j3hOh7qZxuxf+bB9PxCmVHbb@vger.kernel.org
X-Gm-Message-State: APuU4Z9QmAfXQ36Y39O/czKsdM6RpL8QPUlkeL2TN4cxLFOlur/3G37f
	kV0ikyRfXGrhlwVo4NswNsIschOkib7OdZT/b0ANxle+KmuCEZrJ8RnJcEo5YgZagfukRBPo2RU
	ia8e5oGHCV5cPR8oEiQ/14NJELInEaKV1r4JPjOmkbiE+uy/gHhvcQp+nDPK3BCOWqV6d
X-Gm-Gg: AYBFou2gjjsCDaQpoSIFZrpIbEpljXGyJBCHcC5nyBr4+tyRMHBD3eh0SGd3Pl1Koia
	zN9Kr16kAHAJ4hoDDyGYkuIBftM1RA/fiXTetPRvao7Ctg+Kk1q8/SnmZjp+VIv3uHM6q5e/0nA
	K3UbQCzlgeQRvGxm8GJWCNW3BFNyeKH5fzmU8nYVddFTggOxl7gkYjgO6sbVSzuOi7jFKWXVHtj
	09MQzCu6TfalnKzaeIZ2K7ZhcldyXP+MMilZ7zi4OzZZs3YEqOPaPa0u4LYlPgeurwf6mP0gRYq
	i2Z3HjQEdEXJmb9tSoKJCwx1w4jJSjlsIglgCKP8mLts6UeajKwJ1YS6Rmv3OJxQ/AgVaLt+jvG
	omYH42f6AUiSY38WHi8iQoMRXvRMl5Iews6FPUHiSutKQV3Y4Hhee/PCu8SCkcwJTLHRdtSkW/e
	G7X+ZlxOnTmjwgtG4+O/b+7bwu/GpXmQY2EuQXpZS+ep5mYtBnpw0yuvswouymoFmtAlpRT0g=
X-Received: by 2002:a17:90b:5686:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae8970f262mr7010506a91.12.1793602489071;
        Sun, 01 Nov 2026 22:54:49 -0800 (PST)
X-Received: by 2002:a17:90b:5686:b0:3a0:e1f7:9b04 with SMTP id 98e67ed59e1d1-3ae8970f262mr7010496a91.12.1793602488660;
        Sun, 01 Nov 2026 22:54:48 -0800 (PST)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9bc6f7sm16841542a91.16.2026.11.01.22.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:54:48 -0800 (PST)
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
Subject: Re: [PATCH v2 0/3] Commonize Glymur regulator settings for fixed
 rails
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
References: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 12:24:42 +0530
Message-Id: <179360248274.1904790.6967545590442532579.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793602483; l=98;
 i=sivansh.gupta@oss.qualcomm.com; s=20261009; h=from:subject:message-id;
 bh=fzaE2019/1jd2vdupDOK/Bc+lldi9kzFZLW3431ayms=;
 b=GVogEOzbzSqV6k6efdAiLgJXUZPD4HLzsIOtE+xD9rCKWwCF5FHLsim/19Mitz+mgNC1eYZsq
 Dk75Yk9ZonKC9zImHFfCj3+dU58iSbN875U5y+yXTt7TcK1tik6QOe2
X-Developer-Key: i=sivansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=FlECOaX69DTzzKU8Gkt1zsAy0qNbAjbWuX+HULfCv/Q=
X-Proofpoint-ORIG-GUID: K4BGXpVjkqNXOMWPJUqCZAHRrv81ssb3
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae833ba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JkjcV45McEFikerTOJAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: K4BGXpVjkqNXOMWPJUqCZAHRrv81ssb3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNyBTYWx0ZWRfXzTKF6IIN20vQ
 cVuufJV5sI4Q3N952Z2hD+opHdJYGKucrBMyWkSFtppGEHcez//ZNr5a6yPmYWHb5+mNgDGRZyG
 8X+bLTjlNWqgWC3t5Q1BqwWrUzW5Dpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNyBTYWx0ZWRfX+zPXC67lbzaG
 Hi1mLCYx6gKOs5yDSgE4EBg1PCaPOSNTl6ETnk180dLtt7q3ZEpcCGzlFAOKxFNKur3QOJTEGSY
 IODISss5mzKZqcGr9F8daMZVDi0PE67+GgO+7HdukBpfV7ULZrp5l9M9lFs2SEY+lIcpsJCtFkJ
 ZekN5s4/qDQexdTXVjzELxnZ8jY5ZZCxiq5ajs+i0gjukmfvaX9HsS93RWDBjht7cVIk6/JbZ86
 yU6nN8z+XooaC91zvPc6Lyiek4CkKUnos08kuoqUO1Zsu8xqhDgi9IYlz3IZw3BH2vKqvhR7DAV
 qvx2OJF0JejrOOUYlIritD+K9NaFDdEI3aMv6QoDLEkPuI79PSy1QqhRuLvCszofuhKfXxnVi2c
 9C3+sVZZLmU3b4mGi6mK1twlkp+PFlXSeQ+mcSZS5pUB4rf1cdVgUeLDZRnhj8xpgPr/UNJAZ+E
 2To2K+C8nn0GPET5Q9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020027

Tested on Glymur QCB and Mahua QCB.

Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>


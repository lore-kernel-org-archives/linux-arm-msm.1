Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A71E1DE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163724; cv=none; b=JsE5BsC2NHjkH/kzC2gUz7HD1T+g8xGq56NuEt6lITiwzEUFxF2Oqsc1mZ2B5OapGB/Lklbcs24LEGwtdBmCEGQO16bUhEoZc2ni1tFh4hdpAohLJo2bo/vHBt0JcEM7CLVY9L8ggiv7/YDi1n9GW4fcam8TLBnQxJ7u/9KiroI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163724; c=relaxed/simple;
	bh=N4s7OvZaL1ndieVWn4UkLoN/unkwpPgaNpfvmFseIAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKwj7ypANbLGRhFb4Op0KBz53xg2iS/rZ2b9DdwdbcZdyJn9FAL2LbwJdf9xp6LVKlN45+W+PMre8vyBBcyca5Q0ZhLvnQ7n2lG+dFuIbFvl22kRY7oQlIVNrUIpsF3EwveO4H9Rx55VYhNtUlVlkL9nIIMsuMlhWLrlavMP8JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1mfa1fW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsIlec84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1mfa1fW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsIlec84"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlsI53787481
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7d3IkQuQDeyR75j0L7EWMeldSAvWqRXqJv4bXaoxGd8=; b=d1mfa1fWdKNijENh
	HTkoNQBDv4w6fEwy1vnGBYCRKMBNDwG/9PehnHSEv9nIIxqrq1kNQjJSpHny84W0
	5IUNjGxedTHhmF+0DlD9HWXWzrULgsAq7+z2LjPRcnjZ73hE7CaObb2sOSIWWze9
	Cpo21Gv3TCXpTgdBiY/gpFiASLVO97WJg9OVtY2lnwdffJcM4P76NMe4J8FRPQMw
	Eid0pLbI3rNwQUuFYVMnpJK1SnZG0Co1vJxPxIhdx2hyTEU2qssjIb2anf0UGmjo
	GqDpd5x5UAk4RBZMISlHJCf7mk58VR7cvLGwmNhTLUXcaDztT/KZKazp6FdMrMf0
	P/QIzw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2hfen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:48:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso59336921cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163721; x=1785768521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7d3IkQuQDeyR75j0L7EWMeldSAvWqRXqJv4bXaoxGd8=;
        b=QsIlec84RCGbZyBwUI8b+IuQ6MUs1Bql1DFqE5aJoFonCs9767EeQ46Qi2uOF4WfXG
         hWXcdHfYdbBP6g/UgqEP3B7pBphlQQsLL6j5p6uVUKbgnx4hEmvxpo2NS6iKy11Djzb7
         bk4ev3ysLOUdIrn0+HgRhTAk4N4YQ+VxHWfgSgfoLPlXoZIrUnArEtVqOIovp3MjpD8G
         sWuhXNPdpDcu+AHRFRVXUfQiOFgVm9A8kZGaJx+JyimH3V7J2iTPNzoiHiTwk1NzBgdj
         c0jKNpa19My79ydYQ2QqzyiaoZWe6riVxBV0gc2ygE2rJdRhoNsdMRczpkUS9VzrAM32
         cR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163721; x=1785768521;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d3IkQuQDeyR75j0L7EWMeldSAvWqRXqJv4bXaoxGd8=;
        b=TYs7X6QzPju7HjhbDEYGI3Rg1TI3a/Ng/wkNMtdJu5Aw5udtPsB8qJemUyElTDOOU1
         tiDmO3lozQQwUAHMN6mq93wiVAwUhA21O7KtwntP3OdZl2vyf/kb36A6rZ7a4I/IJhKI
         HJo09SARrX77FkNFT39IhnZOQWFOakODLBybttq+iA4HsyNjzRV/Qsqxe3z23lGoDsC9
         iNH5LdOtSuGV31lJnjQr7RNobwuzxxL69ngtLhjxIRNfiaQM1Kd4trq8ZBZT87GLcg4X
         grHBbdISK3lMNiwBZROr6o0dtrDqyFedoHEASu1wsolPgRxIHmiJKAdEAQnjaC0UUL9i
         1Yig==
X-Forwarded-Encrypted: i=1; AHgh+Roe66h4Xk5fTU+1chr5m2NYXSWyAvY1mqrLlDXwUZhdMamf6Hk2OEYOLe5yS4Gy+G2H0lXSG+gRQ/cXhbaz@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGB4llS+I+zi9VoyIBJtnLi5EP/tiD8T4zqP/2zmLHRDiKww8
	4k1Nx7Fz970P1pj8mQFoKovdmPVBm1K/sj/IKWHAyubfzGqUGm0RECgkAnkIRpUwE4aBLGp+3HL
	4R7aDeao5z3RuV2ZFCnxu5Z9w1R/xJFhf6JGPPsjku60eCumEvqMvKtmbVsaSRDeiQDA1
X-Gm-Gg: AR+sD11HG1pr+zl1VUquyvJ33PZMs0kdaYR2sw64FcO5VDAzyl03lRuZVjtNX2Uw/Ek
	c7uKh6UjI0AY+/Ih4R14Pb6fp1pmBnKx0XBjLjC+j7+Upcd0JIhik/fehbdd09Xzax/N+bfFZS4
	cO3E3qZS9gl+5B5duFoDnBkWBE/y2cjPIwxQ/pDbpn8oalIMbBeza5z2tdoiSRK49SdzSZPcTEx
	CjJv6g2Q4Xeq2UOQn8BmYAimOSuVJ5UfwP2J/9aJATL3VfVM1cCfObLhX8pzSs8ihhthGZXDbun
	/i4YOsWe8Xal+UVcfSnW4rF6o8jcY+UUWPn4BDf61Ci3sq4QReFUMUPn6MKXiYlnD9F+DUVEMtl
	zyGd7OszZpxXrm/G5O2112T3Y9Vs=
X-Received: by 2002:a05:622a:5590:b0:516:dc75:1aca with SMTP id d75a77b69052e-5295d377ea2mr115067921cf.26.1785163721421;
        Mon, 27 Jul 2026 07:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5590:b0:516:dc75:1aca with SMTP id d75a77b69052e-5295d377ea2mr115067721cf.26.1785163721043;
        Mon, 27 Jul 2026 07:48:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a659sm50527449f8f.6.2026.07.27.07.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:48:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Taceddin Sancak <ts.solidarity@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins
Date: Mon, 27 Jul 2026 16:48:38 +0200
Message-ID: <178516371435.62304.2693813045161690629.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718002146.698973-1-ts.solidarity@gmail.com>
References: <20260718002146.698973-1-ts.solidarity@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX7NbWPmVQ46Qd
 Q7g1QjtMdBd3xvU0cypNPvmExVFnosSnqfj6X2rGqr9NS7raClx9CXMafV4s691QlESNmMQS1ZX
 cOPG1Ap2cxRUsc59VBoRZU8vo8s5Iwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX4TqYs9SKH3ED
 54s+bLfvWp6y2ggT2j4I7718BhNLEOKfnCBFkdvRi69KMqMf8G+arSGKWrUDdlMA08uQ0ZpIpCc
 nR2oceLhj6AqKcwLUwdgkXkKO3Jz0zfw2DEbw/9q5Hn+Je1w8YoyvVAzPsqe91TANDPFXYjeJdc
 p5djyKoR5BpXpiQ540jwyb6V8F5bYn2Jqc39ERARMbGqQY2+IWy0YxZR2Ijyo+bOz3vhOGzhwsF
 xS0+qx917U1SA6JZ7Ajs8n+8kaFPW5/G+dLTIwroFBQPW40vwsmSZcfo8Hu6tRKCL70H/evSfOo
 K804ICA7vb7H7tC2fKRsQNLwM9gyPjKiS5vcSTlHAgfr8vLlgfvnTimZ0Z3nffpsxgugIumIb+/
 IbdOEBwny0imha8+oiXC+1ffx7kR+aTB4/wGoIvoH+sNENMyw43D5p6xs+d3ORFxMhcoqxt/UYA
 QgKrjCJgIhxKX3THd4w==
X-Proofpoint-GUID: hp-yZUmz1IyW4t4hzc-5WwbRnJUb747F
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a676fca cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fW5ZgvKe1gcteIz5WIgA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: hp-yZUmz1IyW4t4hzc-5WwbRnJUb747F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139


On Sat, 18 Jul 2026 03:21:46 +0300, Taceddin Sancak wrote:
> The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
> "gpio37", but in the pingroup table those functions are muxed on
> gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
> This makes both functions unusable: selecting them on gpio39 is
> rejected by the pinmux core because the group is not listed for the
> function, and selecting them on gpio37 trips the WARN_ON() in
> msm_pinmux_set_mux() and fails with -EINVAL because that group
> cannot mux them.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins
      https://git.kernel.org/brgl/c/4a2e2c563b0ee2253a7902f775bf71232820186d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

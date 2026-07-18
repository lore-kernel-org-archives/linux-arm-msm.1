Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC6382287
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379411; cv=none; b=D7W1r0+3ATmPdICSA9NBXCpclUmSFcLp3vJDBpmk+Tayy8jn+r5sEwS8CDW3+fPyn3PRfaU4K3kfeQv0hPzdRNK0UdgCWbQjx8x14t5jtSO/9T8Ckdjm7g1iOL4Po9rWBS6mNyVBDhhjK4eenZ6bIs1YXbB0kBX5i55By7vi0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379411; c=relaxed/simple;
	bh=DDibhNq8GbSHNp6BcKkSXQbdjHjDiWHzHvxWR5kBACQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNmCkgGRQxt7L2YRm+ngOfPASyk6VFKPwSy8+K4WsjSSys2XEgjgnMPXylf9Xdm1T1jy8/U/knqK7UvFLTtBHtbZ1esLoLxj3cc+WmDqE2+oCBJ55BhwGHk8h8ZSwlXwIm+br3yMph7PnQCc4VstnBnJOV36PS8bWyw/R7d/FRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXn6UjSl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0STSd51; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aXn6UjSl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0STSd51"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHSdO205846
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=; b=aXn6UjSls5rCTgRK
	uRP5vQdhVekU49n1gOLMMoDYplWTuWPUg0jd4MMTkALQPxBfZVpXtoQO3HJjQ10H
	xHzDT+llmALkXPdazrsaNcP4TSwjxEWq3UkKd/XFOsyNCp/Wu7eu2EfanSpU4oJB
	tNsBKRuoLA7oj55wTA3Bq/VO97meROIVZfBYGLd3WNrdVegJIb8c5DZ4UHWFfZyD
	O3LowhlbuOtoJqcnjYOvA34ddoUfAV6owN/s5sePRVzRz9M/JTlNBEntPFyEYoAP
	NnetsIzqKA+fGJG+QUKy50OI2sM86ZZj2A3jlhlDCOgcliXvELPRzdb26RPMrlSJ
	O6yf3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvrrkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so2128845a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379409; x=1784984209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=;
        b=K0STSd51H1tjOvL1euSusLBlZMoBq9H/jnRrC+5c4RuC4MmF1PhWCuoCLMDRY1H8yq
         unLhlj47Q6u5ArJ9cYgqiKA7fFl3vpewHIV0M05VkSGRHjnMT8UytyJaHOWHG5nxIMlW
         ZueWaZ++DKDRlYLmXvR0zRzf/lSx+asyTZlGD3tE58LNI/HTB8kIn2vQOqCvWmkEaUzd
         GLTcGP7Dp4Ag5EcK50qgsjphqveUuwD8G0Kfv4hXUhsBtr3/CVM+GlyaIIUs/ziI13j5
         RchQw8y84nmx0GiavMQ3okCg8XXHy3jHOcEVt3/FEEGWkuTOGeGWfug3xuvDesCtPW3v
         j0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379409; x=1784984209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zRCqbDexTjq2/U5PlBKikyQSF4mNQEN+DiPj2REuMQo=;
        b=rN1IgczLTn7Q3MUrsh5EYnKIQf7cVbKTFnNf6HGHjC5FJBUm/bzh//FQNTwOTF6Cmf
         OvpPlREkZBDdCzXXSVIRAdHzccMAYdp/GUIlUYn8Fd2BoZOgUL00PAUUSq/xpc/I0alV
         6jIwfnV+Ga/9FPoxkmKMALsEWyPSPJrQf8mE5u6ORUED8WaEPnlUfdBnWeyg9n9B6zJO
         Z4m83rvf8qtNbVCuns9tKSF8G3N13FAffB1CYQPieuHaZ2IZER4s3J7nzCk1k8MOxpiP
         6RSuD/hLSfpFnj+LhlRkkK7Z2VAvlL2LhiTHOEZIk9cDTlAoj3c/kpSYkU40ddJs0Do2
         uvgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpX0mu5tcJ+RZcro1zvVo8uhP+MTu3DLOrinsnm2smX96vf0QENIHbRDYWq9APJt9do3y64ZDFGjdAD0ODR@vger.kernel.org
X-Gm-Message-State: AOJu0YzC/H1J+RDVb0pv1zH7lk6+QtW686eISxruxbJP85nNEeseEYQS
	qwKYHhSqX8lItfOl+AEJLhEfkEIz6zsGr1VBLDorEns1mWrePeUyGW1L/DPLpIJEU6uc+gP+Ynk
	S/BMhUakPyzmbABIGbKfx8aeZSNbGuT0HY6XcgZoWsxmehYN6FHVfm+QHdgTw8QCps9ce
X-Gm-Gg: AfdE7clQpo7IESurq6fKY1qTEf/32W6Yj8VIydj08jpw5ZovqmlOeOApOM+8e8ENWrA
	yqxAgAlTzvvPcUueOHjihmtrkKaRcY3OgECE0mvF5UO7lI714PSjiqM7EFztn/ZoUrU7PEq86r1
	A+6WGp81qwpI+Nw9XHSHzAg+l+Bv13y+NGUKmbujo8++GbPh10Dc08psNI8h0vYME6XMwpjWzSE
	gt0Vgdsk1oQOxcF0RnF5ngxXdkTvlfsGQoNv9HKzy1EBjhmoF4zo+28seCvTjW7bL7KiTObhkGU
	OxTSgeaM1FQScwmjRzEh3taiAlvhK1oPsu7mUeaQyQY0Xdol/WFg9K2dC0igEuCtwRT0pBBrsiV
	qqyxhoutZH0ciX/QXQLN8dJ3StwkgPhk=
X-Received: by 2002:a17:90b:2496:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-38e5828ab64mr2495310a91.19.1784379408926;
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2496:b0:38e:5828:a446 with SMTP id 98e67ed59e1d1-38e5828ab64mr2495290a91.19.1784379408508;
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:48 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:11 +0530
Subject: [PATCH v6 04/16] clk: qcom: dispcc-qcm2290: Enable runtime PM
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-4-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: OYGtgZ7TMNGFsWm-2cF14-zr0PIofzK2
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5b7811 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3kQL-WaTcMt34FzATK8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX7QwUMBc/XdHo
 icFhdQ11oEv1IOVHbVJ2mgunz49ikZtDs8CMmAjrSlMJEQtBLc9x8IS+h6HogbU1AAw3ZEz68Xr
 +3MPD/CV0+zy4taNtQq1OeiP7dCRtCe6ARLfaP7G2FEXGyfnQv0iFGKaJZ0DZqlNgEgtqBd7eH4
 5OI3Tvt8fU/xs/PKf8ogexwr8ExDUjxgyaaQ8oSvnbA4MEMJEYO7Zn12a+PFzZodIFNnEZs7HYP
 DnnNCOfhbxWuLC2ye4DjVXLp/CagBprRYue527L2HEJMyrYItwezmljnkTp95N+6cFUeRhmFo1k
 63h1t3xl6Vs3y/0tNjaF/YCqouNvd3WLLZL1M0+Sq350zU1leSVUJiZxmm4+pXQ6ZXEtcfOnRy4
 asQMzsl59fN2SV9UiZCTBdpMNU7+7ZCA+/ELQElYfIinCiSNmIRiJ7JFUkRGJ7nW0MsocKdGSJJ
 AliMG8c6aloEk72dmDw==
X-Proofpoint-ORIG-GUID: OYGtgZ7TMNGFsWm-2cF14-zr0PIofzK2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXxw/oLS19oU34
 8p2ZOQmMEj+6wUU2WYAS+2h8rAOy+4Hdkf3jnVivaurqxMXjp7raEPjaNI+LZeJbp58n3b++smX
 tbIEL0Dc9OfZsvX3CpSJE4KwCtFLx6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

The QCM2290 DISPCC is now associated with a power domain (RPMPD_CX) to
propagate genpd performance state votes to the CX rail. Set use_rpm to
true so that a runtime PM reference is acquired and released around probe,
instead of leaving a permanent 'enable' vote on the power domain.

Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 50a0705128a37073a077b560d0c9e57544d54348..2350ce7f46d9f6e395c87c7a00669b10e8bce3d3 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -515,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.use_rpm = true,
 	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 

-- 
2.34.1


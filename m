Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143972;
	b=Ao4IdVlAyJW/j48bjBP46ef0Fuhf84BVnlX54ufsH9XMt27o2TailUVvMKaAn+DmU1cM
	 Corkn2MlCDDcLnr4ftM22FocS7BrDPI69dlOH0H7rNPGQ16lFuNl6FCASGh58lwstop1Y
	 ZUeZSlTvYnXd+DOCEivzV8W34A0EsanbuCiqJ8Yor+t46eVirBQHtEIi+RVoi3TjGY4u5
	 T8N/W1Iu5v0UmtEj5tqO75c5XKM7f5A6liqbVBvusejvH98iW8ZzLF6dvK1DsmwRlGRR9
	 fiSfODZB545cIPtBjRXq1VnnFCtEOmK7j8wivdpTRkQ6ZriyvTuR2s7HPWLEW47JYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
	b=PemaJTt+n/e+WbBUgE7AgCij0W2wXYaQExOGz4MYJGZCd9HCg6uJ0/3i7x8xqsDbWa3I
	 RoapzGNsE+nrQZvMRiwlawLdj+vQwFMRC+pCiKBohCajzD6HDXgXQqy5Olnez1W0CVpT9
	 7qaVIWmgIhZArhObDzFsTUArV4GKXp1d4cGegv6Qtjcx8tYnxiXnE3M+uZ09QAOXhlIrx
	 6YgP2kyZAfs7c8sq5rjdJELrxh259LPdr3ixb26sSjp0FCov31YAF5J4d2DjuEaHFcg6I
	 eojJswaXzLogUQHXodnxcABae3akpO7gkLbmhLwN9YA2AbKYpeuvwieURdHNq1J4r/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lp8FAaoB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lu8D+tRO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87779606A323
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 13:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87779606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lp8FAaoB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lu8D+tRO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8An0Fu1249028
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 13:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=; b=lp8FAaoB9SkKnlU5
	6b9lscm66V7JtydxZcsJ67meybrZr6iDzXdbllf8cV6231qrNwTK6+WqrLQHb7Y+
	EnHh/+4lnMxSwSU+VBWena8DRvxNAdRM8/+KrMWqIu+RZXz7RprmpRcF/vV5/4WD
	pMps3aAMxhRboDy1xj/fgLuWgEeJstqgzUiKUQKzJpCZaUNj46PfUTq/rxXIXlA6
	7dXA08BLlIE0O1R2hbFn7a7kZjn4PIuUpYs4Uzfsl1OHCoRoP+k+iU8bUuyvpOH5
	iuHF5IRucm871I8wL0C9oCNc1gfa5Xd8OUMxOzkAX3Hw4hvcK8dqPsMTEl1/xmfN
	+Ulh6A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnucsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:19:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36efb506f29so462938eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 05:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143969; x=1794748769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
        b=Lu8D+tROfMQGOAA3pMZ+EZ1tBV41vijXM/ETrvZOn04mnnzr8HAxTyhq2lW9gxsUgX
         EUCeulMRzofnc9eJdfTFtMKTIPJz87sgQz58jFD7YjQxhPHmSGoj2BU48iTrRYuI+1rx
         quiCXPbWALKJCjasMu01GRQLqgznpFfZD2W0oo5SxGwWwQUtuZH8wF3CDCcy2zWGIMz7
         nQtXEAxH95Z30XQoVvjujyjxZtF2pezlf9gBfmXCPvb/cSe4fXBLHdJwwPBRQPemjHlL
         rvWKfCiPX/By6Tg42gIiAacg7Ket92nFzha2NtNiTfN3CSAPLddNjMZv1B8uh8E4GqEm
         CC7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143969; x=1794748769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXe+y/k5WlRUSpbCLSG5IK4BPoly0uOYpoUf4Rjaxf4=;
        b=ZztTsEFXmaHOSQlWCIjkXcaGT/KZCrSJmHPtuSt7UA5J+ZmbBBH+utmG55jevFIA6n
         6LEBqd1oqTVv5kBysNQ9aORmYA4/9DVBiOl6hnjP0JeYzCQmD4IBlI0B6XSQNEtGRHaj
         qL3OibZUbt1ro0Y7jx4LvpbxQ/6xGnu7OyCpxt77o9aono+B1ZezONFf0Wd65IrZwuWn
         vePJwVi/ddLISyeEtbWrabuM3//rvaqxnTRs1cILgFPHShf52Tnb/zot0DmCiInf5cpF
         abBBbq27LHIELlrKDrq2ggb36wt9OuXjQ1jWrdws+CeH6LrLEkIbN8yq5fsIcpc3Eo0f
         +mLg==
X-Forwarded-Encrypted: i=1; AL+hErG70remeRx1JFZgfMaARFVGYB2UykstsOo2d35sZr+vI4uEVTFLsZW81fgpVa67k9+jsrFuE1IWXb4zgR35@vger.kernel.org
X-Gm-Message-State: APuU4Z+YS0fOG3TINyXCDWG7/7g+P0HhIldYNBNXn8JJ0D1tDAO5Ld2q
	K9qieM31Rh3dm1QxdzUAj/uUu08CECO9yB+v/Vg2EJIM4QPaJQOL+7lUm7VRv7BtRMbdDlql1F7
	FUcxubb/fx5ErqrEt4syozi/f7tCtYPqC4/dkJMNxFtRrONVBdDL+v7PmmkfyW7qbuPbR
X-Gm-Gg: AYBFou2zAc3kvOMymI5sjxgCKwmYX7+ObYTKkca0oZ7XA8KmyYdakyJJbb/SmUZngfV
	6XvLn30E7im1H5qLESJnRHk4xYo3gVdWXmQplM8SMIZhYadcrNe5OjVUOn/+uNofP51xDNbDUBD
	OXy6rxkyztTZHKr8d0YRVvEgOVGNfpHjIGGbsXow6STD5E4V0XSaqLlqF97DGFgCfEd06LX/pw7
	efsu3BN5kz3Oaash0NKGKbK+PZnhHrKRDWgMvjEGkHiUD1mwyfjOg4P7het11fiPTxfgs7ARPIx
	VBA8ZBfeJ7KN2sioo1BPkLAo4tUbKXNvo96C14TR3T9bLe1oKoWtzaaDpTgG7ihscHCmWV12cCd
	t3LXvg/StpNlfEDvGKHCCY/IWW0xjXFSfTLMlbmbh9vda0L+vSx8222T0vXWlS9kHPxlGjSx+rI
	RCzTM=
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr1867712c88.10.1794143969459;
        Sun, 08 Nov 2026 05:19:29 -0800 (PST)
X-Received: by 2002:a05:701b:2611:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1b39fec9030mr1867689c88.10.1794143968780;
        Sun, 08 Nov 2026 05:19:28 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:28 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:30 +0530
Subject: [PATCH v2 09/10] arm64: dts: qcom: shikra: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-9-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: QR2thEBzesOsR_GHYLu9IofnRTqngAR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX0330rsi7EuDE
 2Bnsu3/AIZOJJabzzuiOI35g2EZmWEWafVXfX7rLn2BHfuKq11hXnLVEKb6lZxATS6AKHOV3tr0
 JtzoYFB1j0p7v7S5Vd2f/JUt6q8zSFpoyJJIJEENxVx695xNuJDde2P8lOsgrOnkZQl+C5y753m
 yOfamdt9KsjVtmeND/jTyglsisLTCmbFgPKXGDMZKOJxHzYgSxue4WEa36/RmwetzWMfmdhjX49
 2O0QK514+Ux1ZG3xNphlOtJ/gnV4LUgj055jydjggzzhgVpqQ+5jhWC8gZxF4nEIrjuXkAo9RXp
 Vk6fAVkwp2HT6J5mp2lhPsUun+S3I+26NfYS15QCCQo7X4++86fofNPDHjWuKpPHh/Jl3w5+uTS
 KTq5Oe0R/DfXK/5AaPi7DOhEku+R2/oGOuudR4xGzqzAtg1APO/yBfWLj471PqKrBHA7XQX2UpM
 xUKXlFEtOK7NN2hy1Vw==
X-Proofpoint-ORIG-GUID: QR2thEBzesOsR_GHYLu9IofnRTqngAR_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4hhx/izw56kY
 09hA305FFZ02AQFH5Ju8rXNaKOlfZuOsiw3pbBEhPn/pFT6d2eB5A8sZeqCZ1ozgxlbJYHMVTk8
 q7RVSMYrpTd9jxgr0bquSqd4pO8vEuc=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af076e2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gfsEk818mMD8xhq9cSEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Shikra
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f..09aabbf447e0 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2481,6 +2481,18 @@ compute-cb@6 {
 			};
 		};
 
+		ptp@4b00000 {
+			compatible = "qcom,shikra-tscss", "qcom,nord-tscss";
+			reg = <0x0 0x04b00000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_CNTR_CLK>;
+			assigned-clock-rates = <250000000>;
+		};
+
 		usb_2: usb@4c00000 {
 			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
 			reg = <0x0 0x04c00000 0x0 0xfc100>;

-- 
2.34.1


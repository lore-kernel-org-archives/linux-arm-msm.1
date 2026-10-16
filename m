Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9902F8EBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132618; cv=none; b=U2THImdThPReS+CPFqdcH1MEd97T9HQjq7d3erw2Yyg3hr/S1MU9GNgkMkR4LXVN6OxjRQkdCqNNRVZyhOk3/HCbUmuVJy1HEuWMjYf6oJLTBwDigjyKjZZqP2b5fb4pOPD3DNTLzbOxbRlrh3vecdi70Qz+UplAVqbZIna7aew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132618; c=relaxed/simple;
	bh=SbBWi7rAu2d4dqKIgQF1wHBrOqOAZBnCc5ssmW97zPc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vf80jmJlZE+McLyYNEaKxAmmt6p7Xv9O1tdEljaBvo0MYkzuB19LAAB7Z1ua0dAgFETPbzH4KBMAEGsZP2pAf8AwrJfrvbdNd+4Kky3m2NEpJC2fY7i5HpD52ZaaSmOBHT97Lv+iA19lhpFvTbX2mcYODTtK0rXWyTT2STLsdpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GghQcuj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUOk2vt/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GghQcuj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUOk2vt/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2BWT03902225
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q8Z9/44SQcBcx5h/zSBNc6
	T9xEkCG/Pel3ap2KBOJTs=; b=GghQcuj6DT+MkdKFX4twfD47S+2ZXIsxHwss0y
	xFA/olz0732XFMYGhbDSZM4Cs+Dk3U2FFl81gX9FvccJ20RXI+YzsABdTtTiwPH6
	V0igMh1TNZzt0v5LY07hkzEzhLRR2YRrOSabT1d2HXm+Xmk+iiWrJ82kht9Ivsk0
	gI8rZRHGhG1kQEAuXgOdwqDiDtOxmU60eEPRUoSfWnLW7rPQAf+n+gUpxIvpN3QL
	836nqyYSlp1GNvPhI4ris80U9inwPZ4FmAm06UCQoYkNiiwtGp+GtakuRfXakNJc
	oP7ck56S1c1GlhRvzzE3IxuXrq//mBWi4aDNVjAKCMn65pQw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3setdgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:36:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so3906949a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 23:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132615; x=1792737415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q8Z9/44SQcBcx5h/zSBNc6T9xEkCG/Pel3ap2KBOJTs=;
        b=LUOk2vt/cK5d3OG3OP/6lXaw2Uhck8dBBmYW5YttNjIWZqykK79VojIP/lkWKjnPJd
         xtISAYGF76DP627Mm9U4t3JsSAjbFaYU11VDjtBfkwlK8vXepf72Yre88YxA4NgQtChd
         A1zXvrcyNvUTUFDFU2rUFlwafT+/f+yDDwjCAK9lPt9osIgAMvwov/3cViKy5DNagyBa
         7l5nOo5N1DjjHpErlcVl7qvdGugwZ1KEeWAMF/vgP7VMUpMJlr2vSgI3bu88OSMT0qAI
         KjSx26cQPRzTL6opAYkouIUPpagU1JeCDgnofUUfdnZ4sNPQtjArMAOVpen0suYL+mu2
         V0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132615; x=1792737415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q8Z9/44SQcBcx5h/zSBNc6T9xEkCG/Pel3ap2KBOJTs=;
        b=y1ukdzTMx7XieMLqATF1jlH85XsMc1rrOfvLrQbGhIziFKJYx+3HRbWD0QJW9Hkd2a
         p5C47e8uZRCbxjwtZSWkCJDMjdNRfzcIh/RZuYEyi1j9q6k+hasjhIcy9p6zvm7jFU0A
         LBCGUJ3JJsrKB4f9YsgpWRkmp4S+IOOYBMX+YoxMipykFILeL+hMrRSokoJEvpLUX46U
         ELvcwjw5YrsQWS+tnm63Jj+ZuSNw8NFSWKSVxJfXWvXIOavXC/eJXWdPojp9QrXQ/zna
         4XVDN42oxkDKHNdlU/vyvAfKZUP5GsDd4D5X1WC+nsRWiknRB+6QYETPxb6muxBflloC
         chRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsj189YX4d7c0PDbdKUVR0Bh1lAVPC3Il76nKj784tfIa6rPDyD7OmFOAKv5/6Tbm1W/36TMnNdv2dkLnW@vger.kernel.org
X-Gm-Message-State: AFq9FYK+F+WcWoeEkKxUFASbQv1TbnA/10PrwF9NIEA+8XAEU5T9s/xy
	7jshLBPnq41inV1xI+C4sPTgtMoK4xipGFG7qwBsT2SDT8bSzfiYCcPXyB4PAV7pLgOi4aQSYBh
	6+37Fttwrt1eXjNUqwrytLkDfpgSMVa13T7gxnnO7yWUfINXcSoJ68zUnBAz2YeIsWUrK
X-Gm-Gg: AYBFou3MkTjsdG+NvAhNemDLR7jqr1hcI7qbdp8kwdCdmieSyLhl4/hHXjm/WM4DkFY
	Ex5ANfi1XgUlG5h6notf7WJHfbMYpTXuMaSxezPuBqPYwWA5L4Wqj2LtbysK/1e/Z0BoRHLaX1w
	gS3oZEdoyQGfrS9RSFTR6/cTstH06tgI6GEAbngYs/FDQ+z0rKV70kcCwseBTb4z+55do5sMue8
	5XAQoBceb3KcbTpK/hBpbeGZwMF9UnYNf4al8he5T7diqTCJjVWwNhSBckmBxgtZbuxnS/CJ+Ey
	oFau4Qm+FSMtWmZe2sVQ9Mt2ulrX14pynvy2RpThaKaeezGV8v2kTUHyaAOoyea+hLHqM4s3cGR
	iHVcq2iEHCLi5oh+z936o6jLwUR+nWdg=
X-Received: by 2002:a17:90b:384c:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ab3a735fd2mr23121500a91.15.1792132615481;
        Thu, 15 Oct 2026 23:36:55 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:3a4:b061:2765 with SMTP id 98e67ed59e1d1-3ab3a735fd2mr23121474a91.15.1792132614984;
        Thu, 15 Oct 2026 23:36:54 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm2703298a91.1.2026.10.15.23.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:36:54 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Subject: [PATCH v5 0/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Date: Fri, 16 Oct 2026 12:06:45 +0530
Message-Id: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP7F0WoC/3XM3YrCMBAF4FeRXG/KZPK32at9D/GiSUcNWLuba
 FGk7+7oxVLKloGBc+B8D1GpZKria/MQhcZc83DmYD82Ih3b84Fk7jgLBHQQEOXhdO+vRXaXfb5
 Jp5Wx6KKJgIInP4W4fnPbHedjrpeh3N/6qF7tCjQqyWdD17oIRF34Hmptfq/tKQ193/ATL2/Eu
 aEXBrLRmqgCfhIkjyuG/jMUgFsYWoI0hjAmqz2kNcPMDb8wDBta7b0ymrwN8R9jmqYnavV0eXs
 BAAA=
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132608; l=2079;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=SbBWi7rAu2d4dqKIgQF1wHBrOqOAZBnCc5ssmW97zPc=;
 b=VS1o8OFndnIWvmaRgXEEgPFHVS3EFhV4lUdzNEP8pErkH18I4Bsx9tmaHsYIA7VqGoV6Gtht1
 BIye6BW1sAJDeaf7z6Irp2xiIqOAOQLhD6L5umNOrSke39THQpys3ti
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: ZE2YFDyDrNzs-elFbq-LE4pD8Ek24uFq
X-Proofpoint-GUID: ZE2YFDyDrNzs-elFbq-LE4pD8Ek24uFq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXxVqoaTXZj6tY
 HPzhb1sse68x4wjSKharQ/r3KYAR6h3BUzRd/UvWApKq+sdG2sDbSX8lrp8eEsV85FDJWXcMTs6
 PvvKpQiBsbS32/+/gYzxBArfDfN+gxw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX5VgB7W5xOSbd
 an4qtk8qERtK5hCMu934Gb4CPb/lPyAQCfbvWKqndNBDM9Xji/VTibDE567I7qQJcR0JiOoCJri
 646wkggw8CwbM5eWfzJoAPDhB4X6eLBpTXJZpaAW97EwwXouEVkO2DuqhpPCwZcMAi67JW8BQpX
 Rpku2vjy/5khj892+ajbYjIeeNLIbiIU20mb8eAxzsOB5MQ/VRk3/vBlc3PQPElpcbCR1VUr3Ut
 S5vHoXHxw8MxrU+EzsttnHVxq0ZqWU6k0y7CUFfe8lOWBvzJfZM/3sBwGRgqouNy1gdnL5f6ItX
 iwpPWT8QAuTPAegvsgQsvZtHbny/vEqy+xR1+BWHQ79a7K6tOSnq/H3d4+cxTH73GCoKkyBJ628
 uG4vvMFXffndsFgljDkmefo4q4j3XfV5vpa+awDq2I9xzM2XKaGFmcXevZw0AD277hz7gbnOARi
 XgBBBIDdJhkmNpaxs4A==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1c608 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8BLdeznasY9QL0IlsjIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026

The reg value of a compute-cb node must match the SID (the lower nibble
of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
of the Glymur SoC, three compute-cb nodes had incorrect reg values that
did not match their SIDs, leading to SMMU translation errors.

The fix renames the nodes to use correct lowercase hex unit addresses
(per DTS convention) and corrects the reg values. Since the fastrpc
binding's patternProperties only allowed decimal digits in node names,
a binding update is included first to allow hex digits.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v5:
- Write reg values in hex notation: <0xc>, <0xd>, <0xe> instead of
  <12>, <13>, <14>.
- Link to v4: https://lore.kernel.org/r/20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com

Changes in v4:
- Change [0-9a-f]* to [0-9a-f]+ in the binding pattern to require at
  least one digit in the compute-cb unit address.
- Link to v3: https://lore.kernel.org/r/20261006-glymur-dtfix-v3-0-44e2bc5370c2@oss.qualcomm.com

Changes in v3:
- Add binding update to allow hex digits in compute-cb node names
  (required since unit addresses must be lowercase hex per DTS
  convention, and the corrected reg values >= 10 require hex names)
- Link to v2: https://lore.kernel.org/r/20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com

Changes in v2:
- Change unit adress to hex.
- Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com

---
Ekansh Gupta (2):
      dt-bindings: misc: qcom,fastrpc: Allow hex digits in compute-cb node names
      arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg values for cdsp

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml |  2 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi                     | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F312747ACF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308031; cv=none; b=JJCFJWRvMPeGUyCmgsSO3Xss20ZnwVrmZh9kYI7oC/0yxugfZAW7kkcv+zzItYjUinHxIBBedtD21BIJozmkhs/rdOpM1ywo2KHytdE/IFcL6q94+v41yegbFnXfQ+qKW19Xtcn3rQYTPm7wwp9JirnpsjUbdomJ9fXYEbffwmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308031; c=relaxed/simple;
	bh=6GLFG1xTRIWRPACFXwQMMhT6WrpmU9NK5zNbhPiyMi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N7DorLvKtDSRyWY7OXNsQMoblsudsp6ay300iL2PXJ4I6OJE1CK/KhSM0QqAGYcYlH7L9BpaQKNLVPkkyMLzdhin/CPLs7X8UMm2Usv8ZaJoDJjb02iL363xlGy31OWoJ3sT3DTs4eWB9wllWwKoCIDP23U8AhBDhh4Adw0lMuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ih+9wc8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8r4N6At; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ih+9wc8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8r4N6At"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9M2bG1025730
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Tar/Lunzf9G40x6czFLcw9Y9DM0E2NsiMtk9ESF9/A=; b=Ih+9wc8s/e+EkapG
	RO47/aJvtnQ+HBk1omj5zousV81tZlijlfuI4OKod/3TfFuYx9VMw/ZG1On+jcSK
	nvEO1xsoUzh3mXoDVAJZrH5CrS238JGX1WfAf6y4DeW5KvNCTRARPt5ot7D/kFlN
	oLMns84ncjCXZUQcEJBRdyPwRZ8/+f5K/BqSUJpsaHlXcachwDi7TN7tKMhtydVt
	hgD1/i6f1663cxTFEZtVHBDDjtsCmY1Q6xp+CKFghRCLOH2EP9YJRYI8CQ2MvlQM
	j+dEyHf9ib1bq9UHRJGpvqL6dok1VFPSfkfdrSb6qaW2l744vNh1Io3+2Zb+IZV7
	vnPjEw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gde928x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d001671a54so18520445ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308020; x=1787912820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Tar/Lunzf9G40x6czFLcw9Y9DM0E2NsiMtk9ESF9/A=;
        b=V8r4N6AtBqgknwxCSNn4nN4mm2t2+QiOJlGCoTGZDVMPD0afTCvjlrwa/1DP/KtGLW
         JQjjZK0vrX76WbI9vjlMYo+GdKJImU5aEYSUbOff4C461VF7JOHJJeGdlpnwWLupPlbE
         ViC9KdO2ElloXskQboYtwstLEvRnhVPXQBFB/TSQJjI3vqDiQ5sXudnQiDtX4z3rdGc8
         s8/fgOZe5ChCZnjFX8fsuqvXpSyVMq3PrFoeMAk8dP2KA1YNj7vmRQg/yG5YeH6+ojOq
         wkGiNyDQXGADZJLLUR4DmzgrXAcK6G9fCQbIpsHloha5/WuiIb6UgPezpoPwI8yjRh6Q
         vBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308020; x=1787912820;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Tar/Lunzf9G40x6czFLcw9Y9DM0E2NsiMtk9ESF9/A=;
        b=dRb+z0BH79CwCCPYwnoCB3P6DfXnpVXjxJ3uiqpztD9nYxHWsWOL6ctcgOvHOoQlCB
         OWEz49Un0dH6EKBqkJ4ZjCrZVMLbAyk/e452fPHU6+iOEuNepVwHvb57eiovOYVWPtGG
         yTahknXVE+RwD2g39Hbulf7emdOJ/jdTnnem+8lcoly4XMhR9KqLwOB6h/1sw6tN8T12
         IOs9IvHqx5O/jsy37Yu6KvzJGdGeCOxsaTmbo8jzRH8qenVGJ7NgWw7RItanQB8uGear
         GVKHPIx0Ai/32CiMNXpLbTN/ol1QPJsXnjrcHjT+lgDNwaboO1VtDGyVvT7ekge+yiYR
         RVPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG7Ch2bq5oatTxLCi1uhPjTCkvnsUXJLZTog2gKNfkEmI6ljGNHEjzAODHKyKfzfCQFcgy9p22HUnPOS3U@vger.kernel.org
X-Gm-Message-State: AFuF++mWS1H+mas7xgBtUpOHso9LmktW3ydzGlc0b7qS3LoIiW9Y4zC0
	JP36TfjnOnfScp2Gi5akOAPFUFAlY+Fd5Odn19T/y8k/NzPQyXQ/cGwy/ZFzaen00RNhINrwk7I
	yNYwiS0J0h0yFhE9W8BbSjrkq/ud2LXEq6NCqCiCz6FWlaChoZtpt0rpofm9c3PCFAt5e
X-Gm-Gg: AR+sD10vWJ48XoB2mQdm82OBw53W+CFz6gw54DfEZZQ+oTUD3DDwdQxlfY6hhind6OY
	bmUJu2mlNodSv3zwKTPko50gJLKREvehwug2xJ3v+q4fI0p7nuy5erFhJg8dVgSlN2ubBEo12c7
	mO47XpbQc+Nz+Yuy/PJtYHnjEXqiPa0LCJz0IpQhUy7q/UIRK6GW8+STCGlIvtv65GdBLtmJnCK
	0xsvmrqdPRMfiq8LIvFAgMKJHsWLelYm/vQ0DnO6yik6ldQpWfD7QlbnPYfvScFU6ufN4keyQXk
	XYlf8ug69Xeipm4rym7L7AbtyP+DZHu9BuK0C7h2BzoAKm7/sBdMPFrpux/43tL81b8Vnniqwec
	njPRktTp12G69tTkq55NYPFMKM//m
X-Received: by 2002:a17:903:320b:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d64ada3d95mr117153545ad.3.1787308019579;
        Fri, 21 Aug 2026 03:26:59 -0700 (PDT)
X-Received: by 2002:a17:903:320b:b0:2cf:47c4:3d1a with SMTP id d9443c01a7336-2d64ada3d95mr117152125ad.3.1787308018802;
        Fri, 21 Aug 2026 03:26:58 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm25859682eec.25.2026.08.21.03.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:26:58 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: qcom: shikra: Add CYPD6129/CYPD6229 Type-C controller support
Date: Fri, 21 Aug 2026 15:56:49 +0530
Message-ID: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a8827f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M24hfkB29sIHyjEHp18A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: kXPHjbzGEhBRoytKQ3Akh17CsTVU6WSP
X-Proofpoint-ORIG-GUID: kXPHjbzGEhBRoytKQ3Akh17CsTVU6WSP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfX4PXvVspH7SMc
 zWYOiV4DnGKbqHuTenL6zsqGHjxLfCxPuI1XcsEQXlg8F4dl4Z40ODnI3exO3tv2tO+fmjg0uDr
 GykQeVsDqLrMbl9pgescWRxUI9EqXNw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfXwuLJMfl8oHMt
 Ig5TAsMLvj+iXuu8iV9klSvqkYC97khtOucaTIl0nFr/RoZQj7kar+OqJ5hi2yeD4eZE1K78glp
 /XH7OdYI5h2bIjeqJIGBBqOdFXy4id3j72ejacQ1N02jIorXF8J4M9eiqlVb4yEZcmLLGXaKnYx
 gITa6Is7XVm9e33K/trNXdvs0N7yT9IgOqVuWBbVgAc1R1pUUbmZ2FuRi8LKPwdHAUuBQv3cPFS
 +Ua3ecnKVGqtK68lM8EEmLE/s8mxMj6b8qqj+on/YaKtVR1fkSo2mnXZTSK/rs6ZYnIIDezopCJ
 tRt8XppxAS8IgWCR8R1/30MKIxfXn2Tq7/nPFTnznJhR2IeHp4UI9+4no63TIQI4rw2SZh1f8J1
 n7yZOhP+NjXgNiNB4xo558RRslOn2oadFlqys0/WgJfDGxOk8QPeNFSQTN0onS0m45O7ll4Wvu7
 RBmED/wuckhmWMyXKYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

This series adds support for the Cypress cypd6129/cypd6229 dual
Type-C PD controllers used on the Shikra CQM/CQS/IQS platforms to
handle usb-role-switch, and wires up the corresponding DT nodes.

Changes in v2:
- dt-bindings: add a top-level "wakeup-source" property on the
  controller node (matching richtek,rt1719.yaml/ti,tps6598x.yaml) and
  move "wakeup-source;" in the example out of "connector@0" onto the
  parent node, since usb-connector.yaml ends in
  "unevaluatedProperties: false" and does not itself declare
  "wakeup-source" -- placing it inside the connector node fails
  dtbs_check. Also fixed related whitespace nitpicks in the example.
- dts: apply the same wakeup-source relocation to all three affected
  boards (shikra-cqm-evk, shikra-cqs-evk, shikra-iqs-evk).
- dts: fix shikra-iqs-evk's cypd6229 node to use the
  "cypress,cypd6229", "cypress,cypd6129" fallback compatible string
  pair required by the binding, instead of "cypress,cypd6229" alone.
- dts: fix shikra-cqm-evk/shikra-cqs-evk wiring so CYPD6129 connects
  to usb_2_dwc3_hs (secondary port) and PM4125's built-in typec
  connects to usb_1_dwc3_hs/pm4125_hs_in (primary port), and add the
  missing reverse remote-endpoint links on pm4125_hs_in/pm4125_ss_in.
- No changes to patch 2/3 (driver match table).

Link to v1: https://lore.kernel.org/all/20260820145036.2035641-1-akash.kumar@oss.qualcomm.com/

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
Akash Kumar (3):
      dt-bindings: usb: Add Cypress cypd6129/cypd6229 Type-C controller
      usb: typec: ucsi: ccg: Add support for cypd6129/cypd6229
      arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports

 .../devicetree/bindings/usb/cypress,cypd6129.yaml  | 107 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |  84 +++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi       |  45 +++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |  84 +++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        | 107 ++++++++++++++++++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |   2 +
 6 files changed, 418 insertions(+), 11 deletions(-)
---
base-commit: da0b33862d815a7c88f2a809e40b098a15a2faad
change-id: 20260821-shikra-usb-dt-v7-apply-512eccb018a1

Best regards,
-- 
Akash Kumar <akash.kumar@oss.qualcomm.com>

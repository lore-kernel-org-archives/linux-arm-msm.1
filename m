Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76D435B62F
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791182213; cv=none; b=FbZqTLG7cA8JWyZnmNEDlV9zS1DWBkgvF27i5LxEZqDNYwrpSoi4LglB9dsJY6Q9ksjwvkWEcnPUfBfT4d8WI1yHXHhQ8Bapv42PGsQrSOP4MnsAe4sHswnHtoQ1UzsBW3kENjJ1RGD/Tee48rvQP70GxIFHq3CGBl8qabXeuEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791182213; c=relaxed/simple;
	bh=jgiNldtjrq6+My8uOdCwiCVWC2Bi9PZ9E17T9SMDTZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HvCnVGJSfixWjQ8Hu63Hz5rhj3A5euM7U02tJlGmXHV2njUMFGYGPh36HrJnhRR94VuRf3oCLIJXpldIrg1qoEi5U3rPe52d7YUYuVK0r0ugwHHpzETctcU0Bwh4JJNXaUemNthmYQlgQ/6mXnXA7T1kuvDLFqEY2tHiTzKmfFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6Q8Qeh6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UH+TY07H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6Q8Qeh6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UH+TY07H"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6951073d3838504
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 06:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Jge+QnRU55BG/zelwO3Kxp
	qdDU0dzzUZftNxrkgOB7A=; b=p6Q8Qeh61Q4VpLRvN9zr5ilIQ8dn4JJMrBh7LT
	PbV1Lpq5RN8ROrCxQSRmdA0MbA7atyBJZxPWo8Aho/R9STwNF6nF+yzfNfoFQaKW
	yvFCatRkfjpIgdLI9jKC/zljQ3xPO7eem4TDi6Xo1W72oCK6Z+8Ah6SZ7DKZFhlW
	OUddcWqq7LIf70uIbYZS77dbtriBWEc4gN1bkDrGDPKTE/Zk5DIcLBcPASXmrFPw
	Lp2xLfHEBcRK4BKXhmS7tb3fIjOaBwwedoVmjmqqtANUaDuPRgv2uGo+J1JrA13S
	DkqIimLJJEsTozNNQe30/Gdqi/K2MGKrrnVrA+eHesyEkvoA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08mmpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:36:50 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3510a481ae9so2712288eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791182210; x=1791787010; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jge+QnRU55BG/zelwO3KxpqdDU0dzzUZftNxrkgOB7A=;
        b=UH+TY07HWjkQ/3J1C870hisDiIdOCWty9Y0LrNluLSHMnYT5PtOlt7zsiQjuN+BKMx
         hC5f1l5BHTFTG1GHEgWWtI96GPs23CtAz+CQVNPrIX9LgiHHAonuCMPwY0ZxfrMlR64B
         TD4O24CDDovhNdoxj5TWL72oJYcbYmtxdMMp7kjzXBzIOYLiYvMmyW6ZyqEi3Kb0wyAO
         Z2vKw/9nrz9giofYHwMZb9q3YZiQ71bq5Gv+cG3bOuUUWwdTM8EMxMh4IinstGvbKGsK
         USlxOxeAEgRz41fdqFSRQH+820Nyj6qJhPdwW4gwYpl8a6vqGty1zEIjcxeuiyQD4FRp
         mqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791182210; x=1791787010;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jge+QnRU55BG/zelwO3KxpqdDU0dzzUZftNxrkgOB7A=;
        b=eDQVpxGOw/o3H3X1urG5tjrc59xRc8tj4Yya4R/s2tv8+hq8Yz8dKGs5CugvzLSITa
         qz9dpe4YtHJW9m6UAi7OcR/VSj83agnplwtYjS+ruejN7tF5/Ia3KuVxcdmehLitUdBb
         k5f45doq7v+UTEUBv2s9L6NzYplELfYnwYOxIhFhpPSubUJCepYr4CrOfQTiVXxJGcGv
         XBUnl/FE61il5ryw+X+cvf7VYE+ghfUSo5kmGWbKKzbxxUNrpEYoSZQFIVWIzJ1AO6IV
         ZWGRg8q5nb1XVrbn4QXCbOK2Qfe2EW7yTa+6A8/yUp1LyR2r7Eg6ulywMcw5pMihN0kY
         l1kA==
X-Gm-Message-State: AFuF++kndyzmgRF9qCNGEsOhE/ZV+a1ZUMCGMTz2FgWBufeqFdlo5WCT
	DE4aLm+i3Ip0o6S6dByY92wRmvpnQH8z57UyAS8q8SVay9t7ISikK0p5S6b9EVjlfNxSKJsAAPj
	IsIy+bCzJ3Z0QE77C2fmDwsS5knuBSHbT3QJVollliymOpqzpu1KfriJbtSaeuWPhil6p
X-Gm-Gg: AYBFou1HeAdMZxA/5fwCWxVYcCA+Y6UPbk1p3BaHcbZGlAIZa++rcF0KZkKrPNIqFI7
	Ag+YghzHVYB1WPoe3S6wAmg3SoiHTnetsKkByTTv+8HZcl0czMybnZTonCDNzb4JynznnIbEZuE
	uhT5OaVeA2ROggYGvR99KopcVwBPYmnz30hm+lNgii2Yt+Bvj4ODb7QA8mx/JK9vrOs+YZm1i4P
	OP9wgW+K5zMvvPLqdjwhIYA+sSGNhiqDZ/jqvcFwUQawyXiS9ZNKTNCHtjNHmaBcuglJi++zpRY
	HP7la70svw0GNr7+/YrWjYmTAJXRLCvzmH/m09SzEU60j+8K7XgRS4/b8m5yiircUYJQ3/ZUEly
	Z3PNM6vuT8D/032ZN5FZKCmhDVRVejhJzAAV0nA2ftJvWjNox2FkxUA6/n+AT4a5/Xe2h8gSvyA
	ZFlysjSk4zX4AmFGFBdbGgSfuyIzQO
X-Received: by 2002:a05:693c:41d7:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34f21865577mr11543806eec.32.1791182210140;
        Sun, 04 Oct 2026 23:36:50 -0700 (PDT)
X-Received: by 2002:a05:693c:41d7:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34f21865577mr11543766eec.32.1791182209534;
        Sun, 04 Oct 2026 23:36:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718d9edsm11185821eec.19.2026.10.04.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:36:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v4 0/6] Add support for USB phys in IPQ9650
Date: Mon, 05 Oct 2026 12:06:25 +0530
Message-Id: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpFw2oC/3WOQQ6CMBBFr0K6tmY6RQRX3sO4aMsgTRS0RQIx3
 N1SNLrQzSR/Mu/9eTBPzpJnu+TBHPXW27YJIV0lzNSqORG3ZcgMATPIEfi1HnmWpVRuyAAWyML
 l1VFlh2g5HJfs6HYPsm5ZMq08cdNeLrbbJQ0NHZ+FAgDZDNTWd60b4xe9iMSrMI2FveDAcbMts
 1xJFKD3rffr212dZ+c6jKjp8YMWIBYUA2pMIUuspBa6+oPKL/TdKgMKeU5bTWAqpX6g0zQ9AdB
 jdfpEAQAA
X-Change-ID: 20260820-phy-664ed5ec0292
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: xeIv7_bvpjWyEjObrVr8_8AxVvCTpWsu
X-Proofpoint-GUID: xeIv7_bvpjWyEjObrVr8_8AxVvCTpWsu
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac34582 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tpprtx7nRKxrkFoMJnUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX8UtgX7xljQOm
 k6TiYh85noZJPabm8zfu66KeIu7/wS5UWyUOgC3Hy3lrNdIFmlkYJR9i1+1Q1l1uAVhoPgZBDcS
 cYBAAJGwbpDHFQFt7nbRUvgpv095jkU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNiBTYWx0ZWRfX6Uy2DN3KY5OG
 HKduZTztxXEfj4H0wDoW4m2cg0rj+/GPDq/MslUXalMkERIYApGePnxvzJUbAevTfudfy40do1g
 DN5DITtBaA03b250wuMc4SD6T/1uSxlIVyVP+RA31rZM1TIhuPWDe7o4QsLaesDgUFsZwGuU1JS
 g6JL9h1bko3UJPpnIac/v/3arByJIZO3ht4+T2M/DqMuBxGLrvFZkibMpx6Hj1kEUDR2yietJga
 pHZlWJrBbePuBqPudbfTwLIAt9e8RGvozQToYYMdtKm31EWyQFh47mlyUTCV9jZd8yRhuqy/ysm
 ZIgd/L02HR+OFPQEx+uENxVbfp1EVRtqsRuLKTVEI4eFdki1MIJ7ZenCYpUmyj8SDD22DGma14t
 +Z+6SJKaHoB4lBoA2u+EMXQF1NatRvRx15y8EfvlK4asl8V5f4mV2eYBVRkW5n0QBoHnqHRTDD6
 hEXeNEraCPNtIX07jog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050026

This series
 - Adds dt-bindings and driver changes for the high speed and super speed
   phys in IPQ9650.
 - IPQ9650 specific init tables to QMP super speed phy driver.
 - The Femto high speed phy driver is refactored to accomodate differences
   in the init sequences between SoCs first and then support for IPQ9650 is
   included.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v4:
- Rebase to top of tree
- Split 4th patch 'phy: qcom: snps-femto-v2: Move PHY init registers to config tables'
  as follows:
	phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
	phy: qcom: snps-femto-v2: Move PHY init registers to config tables
- Link to v3: https://lore.kernel.org/r/20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com

Changes in v3:
- No code changes
- Rebase to top of tree
- Pick two R-b tags
- Link to v2: https://lore.kernel.org/r/20260901-phy-v2-0-cc93d2f3b1bf@oss.qualcomm.com

Changes in v2:
- Pick one R-b from Krzysztof
- Use qcom,ipq9650-usb-hs-phy directly instead of adding a 6nm compatible
  and falling back to it
- Change pre/post to pre_tuning/post_tuning
- Use array count instead of terminating entries
- Fix value/mask mixup in 2 places
- Link to v1: https://lore.kernel.org/r/20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com

---
Varadarajan Narayanan (6):
      dt-bindings: phy: qcom,qmp-usb: Add IPQ9650 USB3 PHY
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add IPQ9650 compatible
      phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY configuration
      phy: qcom: snps-femto-v2: Fix qcom_snps_hsphy_write_mask argument mixup
      phy: qcom: snps-femto-v2: Move PHY init registers to config tables
      phy: qcom: snps-femto-v2: Add IPQ9650 support

 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        |   2 +
 .../bindings/phy/qcom,usb-snps-femto-v2.yaml       |   2 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c            | 118 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c      | 188 +++++++++++++++------
 4 files changed, 263 insertions(+), 47 deletions(-)
---
base-commit: d64fba75362e3459e48b74f0484f82fc1b805d8c
change-id: 20260820-phy-664ed5ec0292

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


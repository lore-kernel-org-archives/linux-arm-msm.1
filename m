Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D343AF665
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789523677; cv=none; b=DapW8NgJGj5al81ZbdahR18aHNxqo2QDE7ucpNM7Njo+SkFtAdaX1hvti5tVx8x740e4yMge13hJNA68roac96BAMG+mSfR5GcBnoDoqIuTmITuBlgB0H+OUrfbJ6VHwUXlKNRAx0iJ+lw/bhogmfJ7XUATyUVuGAEKGyrSq9OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789523677; c=relaxed/simple;
	bh=trtKqQH9PGxNue+PP9ld2h9X34JktvMj0tHJlGOwoOk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eQ10iw4J4J7U0WYSyHpi2atAlAP2J84kwDeoqhkQmiGCE4NexgChRTkcKmt10VbQdiApMgZBckGcyd47Sa1JnuIsUVcskvN/S9Kqq5hGiHdz2JluoiERUL1GGNvFESFqIQSOUrPQNdhT2V2xEC3fE2WsBrTo+I8tNra58imBtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bko4pa2J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3gtrOaR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bko4pa2J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3gtrOaR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FNZRD21408942
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t1aitCWiDfDBe4GB6MgYwB
	htUQ8H3mamaGIa0BSdgCg=; b=Bko4pa2JV1NXswj+hv89dONSHftmDrQjt1fXsm
	mCW8H499qknuKQ8x24lA3U0s94eq4Lhr/C7paSeGjdUfGi3xayHQM8Z6G0/3/m0o
	dEDku6OJq/M9xoXwH6TlxTor4jiSXXaUl36sTQXfyfwdiw2Qzs+KliNDcb2f6oFH
	FOKKih2qf0F5ISlwPVdFJ+c4HW+S877y7uF46uThGklg6H4XBOzTuDtf9ZnAiqu9
	5i/hQyXsVJYbv1cx+sRMDuZDdvUDAV8RcBvC1I5epInXbGa7IMXjFkkUa3aulRT4
	OKDcnNuxzd0bmyHCEa/SSdvrEnuF0l8OzTzP/VTl9l6yqIwg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftugbfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 01:54:26 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso9349061b6e.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 18:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789523666; x=1790128466; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t1aitCWiDfDBe4GB6MgYwBhtUQ8H3mamaGIa0BSdgCg=;
        b=K3gtrOaRqTzZAAcmAd3lyjArT0PHntDEcYa0HJKtup2otyagE6nd32mTdneXoLdYeP
         MStDekMoxFgHD6e+MUcUDzG1ovSOMzzijadfIHXPqsDnlaMFGOhHARpcupzikMJOmUWr
         3EH3vSDUBdDVU0lzCOU4h+E1CXDmQDtwrx39tMmWlD0QqOOkYtGo9TMDBBKDabjweVr8
         HxKk7RfPUkzcx9z4CNBQCRAls4zKY29aZU67yNN+A0Rbe6gv5cZEm7lDKn8RQKbi/LT7
         luku+WmFYRsbPvGGpbcWZ5ArnhUXYY0u0stB/qcxKvIr6xpJjCREpcEf2113zrd5tAwV
         qCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789523666; x=1790128466;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t1aitCWiDfDBe4GB6MgYwBhtUQ8H3mamaGIa0BSdgCg=;
        b=qYuH22Nv535RXafyk9Xg68j/2M9J8AXJCuSbiNJI1C3G3JXJum2ICwlr6UAjROeS1C
         4cbLIYNIo2XIuLnUmFIXXO3//wgRJAC84X7Dl9/O0IsYpcA7M+eZGqEXpsP1Um0wxpve
         5llIlEnI1Ii0pJLFs4gz1JQXRLGtrNTp6bIJTmeo8WbQbxEInu1Lt0bJH8mK2Xa9RQj+
         SpErKKN9x/v2xhpTjd4fs8jvkukKemB0Z0snPHdYfh0ShnxcMVyhoy5040NVxgpcNgyN
         psMV2j2XMuqmsjfogU0L+apzq2KHM/VU1FIiET9C7Mwzdz5ZAR7nvet9PGgifA4YKnFt
         0OqA==
X-Gm-Message-State: AFuF++lavsvOnurVw5Im9uAaBYem/oTJ74YmKfv3Amq37uwg+YbIJJNH
	MkIO84pjEEcthl1SfhV5SUt3yvA4BqqjYqys8JvSSHfMr7jofLfh2CxccwFlo/zQur7lZp8kkwG
	X54+u6N0YYAQhG6Pa4PpEuk/rOJjfRar1EexOBcpCboiN5YiJV63c7eNlK12peDDH1BS8
X-Gm-Gg: AYBFou2fAGmAsXiwchHXvkTmaBmv3Sm6eIFC+lFmNRbz4Lvc9Qk3ZGpEwFhQIEw/n7l
	wbUbebFUq9qz66UKaNix2gCgGxgGztGKckSjmu/8f7KNcF1nhJOS7KcGcQVcaCYyTcxvk5eFn3E
	jCm4nU+YxrNk0wH+1h+4JnWAG/XBJNmbbuV4cU40xjQWeQJWxFHFmdbxavhsIm3Oqq94YlVKebo
	JSIGsdEAyCID2Q9QU+Qlrs4EPVxpekuRI6pifhSFrru9G3pwkReTUEdXpHgg3rS6Pn8d67ACuOp
	+ofz1sAAZITLGqwa9tf4tBHxN3dAJkmf0UQ2bvEKH2oVfbbdz+Zy/2EF51puPvH9SIL4NFTecSt
	Ndsm7dhySEf5/MnV/rIbO7Fk=
X-Received: by 2002:a05:6808:1250:b0:4c7:30a6:97b9 with SMTP id 5614622812f47-4ca4cef5a31mr953913b6e.38.1789523666171;
        Tue, 15 Sep 2026 18:54:26 -0700 (PDT)
X-Received: by 2002:a05:6808:1250:b0:4c7:30a6:97b9 with SMTP id 5614622812f47-4ca4cef5a31mr953901b6e.38.1789523665735;
        Tue, 15 Sep 2026 18:54:25 -0700 (PDT)
Received: from [192.168.86.45] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ca1e09ab74sm1283039b6e.0.2026.09.15.18.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 18:54:25 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: Introduce Asus Zenbook A14
 (UX3407NA)
Date: Tue, 15 Sep 2026 20:54:21 -0500
Message-Id: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NSw6CQBBEr0J67ZD5JC248h6GBZ9GRoXBaZioh
 Ls74NZNJS+perUAk7fEcEoW8BQsWzdE0IcE6q4criRsExm01ChRG/GhoXLuLpqJRYW5VDkelUa
 EuBg9tfa12y7Fj3mublRPm2JrdJYn59/7XVBb7785KCGFaTPZYiZNppqzY06fc/moXd+nMaBY1
 /ULvftLqr8AAAA=
X-Change-ID: 20260623-zenbook-dts-b69019671266
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nicko van Someren <nicko@nicko.org>,
        Chris Pouliot <chris@pouliot.me>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2561;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=trtKqQH9PGxNue+PP9ld2h9X34JktvMj0tHJlGOwoOk=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBqqfbQHOFYzZls8KSt2G/4Gsmh7hMXvxUlS40bn
 wkmKYbqt2GJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaqn20BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWxmBAAtvjoTovvcQKVgxd+E7hE1pDYENeZsV7DuwmlCc9
 NZ/EU9xJOfnl8Gzwq1yq6ji4CqIa3wT4Oehdvl7YlSZ8MND/cHb+oKymzkhFOPkwbxbQrjql5Pq
 r/wVde5SlErfpUQfnFeNSHsI7o5qjv32F+McI1zZbsODYQnjaW9iO8UrnGXfsJmSG4V1aHtT9WP
 nZpMTYgzNz3mXWnH5ppZgzplWW6ysuQS+QTRhlYzXFuKW4bDzThWvNFcaMN4CI3lW1PHLEJsMi7
 FurEZ0HAw8MiaMrq53Eu0fPUFlm65zLfD1gBn4GU1KNg2v9q3LM1GHG/xlOyy78RoyMErBgUlHw
 N5cC3X3xXYJXOsNAfK+1Hq9qoWtln82BpHzUMoulsYgBLXCECzEH6k7wzu3xANjG/Zcr7gqg5+S
 1UtPq4nbtje6fDBf4KNcwnHBH1c6Ud4+8bgJ/WW7Ja95kNdIUseknDVeC8gHTz8vnDxoxjpHp60
 wP9scSHBAQIuneeTVX3FidSSYTam3WwahdW8tRJV1DpDfYLVRI73JZW3NHqNOVeOa5OXJuJxPCJ
 MPFZq4jGmLkQXb3jsX1R5cLYRBGFsVXQhyf1g0KpNSgdvFWrrMKVdSdb5wur5GYmyCcUfi5s91U
 gAWMf3kb3XbOQwq5dW3Yfxuyk9MpxpCyJ16Ae0EUpY58=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX/7+wUkNI6Qds
 VxaPk1z6z32I/fJsBufbpaG36LRtkk5eCaQbx84MU6FKxnDDV8l/xtQHiDcHYWjLjqQZPHu/+NZ
 wpCJyYPGL1SZPxNRDsFKoQLdzfyr8RjRUQfpB5geZ/O2OrhCK0PW31qjGgxZowf1fKaoAmi6qxX
 ZDcNDZgCxbwQ1F2us9KfIXzHo+3vONOQDwFHOgLaaoCEVtcZW7c6SttbGmR8T/7oxHFHgNfXAR4
 iRBp1v86ngV2Gq7q4qCsqqaftLvvqk4F/YrfJqfrWV+LtldnsPFOSeDcrMYkhsg35NKBxYkW5P2
 4iC0vxaNWBmW32WQF7oYTajOigGT6SHCtJ3zhdMDRkhIDhSbz4wFeLaENUyKQyXBZhMGgXkwDgo
 KTFlvvcvOSAA9IDMTOAYo8zAhsLVt0Sd3A5CsS1KlPg3vX7X3qhCyog9mTwMNbbLRr4qz66yRzH
 r5GmsYxbt+/pPLrUKeA==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aa9f6d2 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=bC-a23v3AAAA:8
 a=GOfOgpTQAAAA:8 a=DtrHxg6x1EAEsTDm8toA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=FO4_E8m0qiDe52t0p3_H:22 a=FETSgX_rupNeA0tEg7_S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAyNCBTYWx0ZWRfX5KktJXDGor4a
 ++wqfbgUNwR/u2rpulmuzbHew55iI9IHDeHFNhkJnYbtx+brJO1lbdAN38NL1jY8EKI7nfv7lYa
 fkGbbS5Y5IFRboSP05ct1BYD1Cxz+UQ=
X-Proofpoint-GUID: Z7nps09_CVm_WHmQK8Kn_8ZQFU04yCId
X-Proofpoint-ORIG-GUID: Z7nps09_CVm_WHmQK8Kn_8ZQFU04yCId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160024

UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
Glymur platform.

This (v2) remains dependent on the eDP support here:
https://lore.kernel.org/linux-arm-msm/20260622-glymur-edp-phy-v1-0-814b45089ac9@oss.qualcomm.com/

As reported by both Chris and Nicko, the A14 only has 2 speakers so this
has now been resolved. But, on linux-next I need to introduce a
pm_runtime_forbid() in the soundwire controller (swr0) to avoid SWR bus
clashes when trying to play audio.

UCM config and audioreach topologies can be found here:
  https://github.com/alsa-project/alsa-ucm-conf/pull/858
  https://github.com/linux-msm/audioreach-topology/pull/78

The power grid was revised since v1 which removes the crosstalk
previously seen between eDP and WiFi TX - which means WiFi is now
functional (with the right board-2.bin).

HDMI remains non-functional, patches for this are being prepared.

---
Changes in v2:
- Dropped chosen {}
- Protected EC reset pin
- Added camera, mic and privacy LEDs
- Changed WiFi/BT to use the M.2 binding
- Added a bit of CMA for good measure
- Corrected speaker descriptions (there seems to only be 2 WSAs)
- Added missing redriver definitions
- Rebased on pcie3 PHY changes
- Added tcsr supplies
- Patches prepared and posted on the Zenbook A14 itself
- Link to v1: https://patch.msgid.link/20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Nicko van Someren <nicko@nicko.org>
Cc: Chris Pouliot <chris@pouliot.me>

---
Bjorn Andersson (3):
      dt-bindings: arm: qcom: Add Asus Zenbook A14 (UX3407NA)
      arm64: dts: qcom: glymur: Add Asus Zenbook A14 (UX3407NA)
      firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14 (UX3407NA)

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts  | 1140 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 4 files changed, 1143 insertions(+)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260623-zenbook-dts-b69019671266

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


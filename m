Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91284A3F21
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789144893; cv=none; b=YQ1u/eug1Z0I0pu2aImK4f+RsirOchBdx+QPYm5upaF0aMN6j+375GpFfwvBvHjUFvwpqHgnsctYemzMPG3oHXZg/dC9Uj7eGg/MYAgjWFy3icdlU6GqZY22iXRj2cB3Z5qxpVIS54YTE0AgvDTSrWXRF5+NkUUYDsmkL4UhNRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789144893; c=relaxed/simple;
	bh=J5JrbRax/s9E2GuV1m1+sh3K5n63RAOmA3mLWRIgek8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BedyR8uhobcqoENzbsuEOvruT1v6S7p7uyWanxLNXqRB1z4pcs65wKi1n41QfMxsYcz/7UDyGoG1BTMsWbatSiW6uBUmlhp1FD4MOk8OyJbdcCg0fl3xTFmMhki6aejUGlnzbEgPYax97S7Gbw4OKjem3L8WgNexhXbjdfFZcZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3l36Ado; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGrJL0d/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3l36Ado";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGrJL0d/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm0Qv269302
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JOKyhodtm1/QTbPUZGY4yl
	A5yyobrX9UkcqABGC4aHw=; b=G3l36Ado17wNbbTvJM2CI6kdTHKEpr+MD4SfXV
	pj5yNbDWrIzFCxV0CIjGGKKvIZyiJiA7IZqfFtZbSgE1TLr49M5uUwiOsuIwcbhd
	8/NPBFRYAaoENjU782AJLmnK0fytlOknhHscySFd4g5g7hMP+WcEMhzV3e2i+hX3
	0jdSOqxc7wm+4iopFajVnsF5UlbKFyjWzd9OjtdQZRyL9jTNZf4HSoN98IN6ul9V
	yKcsi1mLcbvu/SsRuNDgMajcrXOvoy3Lnv9mZEoe4AhPJlNZeESIE/+L+RNlbLf0
	IpbcmmzuxzBtNhpNqlq/xFVKoXs2W+eZ1AK1Fks9E/mVI9Tw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd52sn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:41:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b90cc0d5cso1453635a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789144886; x=1789749686; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JOKyhodtm1/QTbPUZGY4ylA5yyobrX9UkcqABGC4aHw=;
        b=QGrJL0d/8DEfido6oIGPs36bweTPpxsscyrFD0ebM4UgdJ6DdjvQFm53fJ/6iAP6tb
         WyXvnyfC13iZw0LPY+joasl2mzg4Db1XdAunmqqEIYFiYRaBnbGDh14js5pT+8VtR1Cy
         bNkr7KsjBbVO+DVwJv7F0riN7i1XPTUTys+ayLvBqnTM0RKBCr1IGfJEfErQiYZErT3U
         ck10+9Y0uuzRRV2uyKyG4/R2lqJ//nvQe14LaFmYW9L1h9VosdSG4/dzLoe73cGIeb9k
         uE1pydQTqEYlT0PeWBttZgboGrIGBzJvU8tjeiqzNZJMbxxml4qyckjXFzqXqbp6QOI7
         aOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789144886; x=1789749686;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JOKyhodtm1/QTbPUZGY4ylA5yyobrX9UkcqABGC4aHw=;
        b=PyzpPRBMYe+QFSYmyrndY4ph458ThA14otKQ6BeJk0lv8JRqEI/rMTpktf/yj/DPLI
         15+pppiSb10zCivkIz+e5/7j6r4L+jANMmsmbxP1iS8YpizTLfYpURJpTarYnmQVS31U
         obmlsUPlR0ooMpjsRAOAWx0jz4wp0oTem4wlt5+qcDlV3QmXsfVgam3nWC+LS+06o/PR
         IvOHY7fFERiM1/rct93eQ+yivpnjbt2eJgwd1lMrsCmCY+pq6qMec6okw9XSYinLXapZ
         jPkpuHjBzz7QrMkzyM2HZd9Mke5fE8kYDVhoKJmns1ZR6xuKvMvzpS5F3sNSHTcDVsZ/
         HoYA==
X-Gm-Message-State: AFuF++m88EkbFVd7eQicLTkytIKgcvEhNQSBxlGjhf/9ya7ZmYST+xm5
	BjNmzQXR26FQC5psO9O6X3ihfxtwqG0GUg0qp39cjryg6JR77YGNb4o34ireifqmOyUMKRjOJqe
	mA6nvvkvzuW8BD3Fsntc4Mjy2RqPQ++7kDkXSSnI4hbBUPzTrOEpbCnh0nuxX7YULnNwEazFvsS
	J2
X-Gm-Gg: AYBFou2xk45QPOt778kmndwhjCJejwrjv0j8OkciNQ9wUt8J7Q9eLyNcXblFIFk8cpL
	YvBAcvrB9OVZ2GYeh6CLjZ5rpXxF6esOKsB71Nizv+rILkK4cjbTsEVtbhXzocJzU4OYNic1IW5
	V2wp3BBL318f2RGh8/+T0VGzOswQKmAoUR28JS07qOE11JX9ay69mBIxWrpPnXmgFRKaiXnXpn7
	V5nkWGW5Qmj300l6V93YQ1ZA1+/PcnSKQlOrJ4Hl7X6Oj3kXoXA/Ip8Nd1+H3u5SNU6HNTkP79/
	qVNb54/HTwbyGHRdA1UUHqNbmJHmg4E3dWe+DFk1u0rIvhrAkrAJsAAzHmvhppIpi3MPSTNv0Dd
	TI0hY64nPejedYJsmWYg=
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr8712487a91.1.1789144885707;
        Fri, 11 Sep 2026 09:41:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr8712418a91.1.1789144885166;
        Fri, 11 Sep 2026 09:41:25 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b2a8076sm1618171a91.1.2026.09.11.09.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:41:24 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v6 0/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra platforms
Date: Fri, 11 Sep 2026 22:10:38 +0530
Message-Id: <20260911-shikra_adc_support-v6-0-e4b2da5cd55c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYvpGoC/33Py2rDMBAF0F8JWtdh9Ja76n+UEvSs1SaxI9kmI
 fjfK6cFZ2F3I7hidEb3jrJP0Wf0uruj5MeYY3suQbzskG30+dNX0ZWMCBABAtMqN/E76YN29pC
 HrmtTXwHIWnDwRgqLysMu+RCvD/T94zfnwXx528/S30Tyl6Fs65exJua+TbfHV0Y83/67dcQVV
 Fw67oWVgUn31ua8vwz6aNvTaV8ONKsjWSQJ9apEiqSc01QFaQLdkuiThGFVokVyzioGwWrQsCG
 xZ4mvSmxu50Ea4QhmpN6Q+CKpjXa8SCYIpYjDyui1dtM0/QCq3bE2CgIAAA==
X-Change-ID: 20260613-shikra_adc_support-0079650eb76c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789144881; l=2449;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=J5JrbRax/s9E2GuV1m1+sh3K5n63RAOmA3mLWRIgek8=;
 b=EHgQauPBBC6RZgh8wZ0YWGNlxckvf3eNPGiLRLIHzsVwLEmjanymr+seKgFPuN/ExVNZ6VQ/8
 Kbtlu4Z7V4+Bsr25bv6WGWLvmzVNSmkzW5mHnOQ8odqfNQj+X5MxqJp
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: EYLEdJ6j2aPihc3XqVnr02Ch5Kg9IOY-
X-Proofpoint-ORIG-GUID: EYLEdJ6j2aPihc3XqVnr02Ch5Kg9IOY-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzMiBTYWx0ZWRfXy0odCSLw4p2V
 5II0TEgSRkHb5o4P0hHd8FGzSIk9VRvOI9y+pJz25GhU/H3o8CwZ7WuQqHiGbMFdnPZXTx5x/FJ
 f6nJJGi/tPUg4ZKTRNXIBH3Q3KvEcZk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzMiBTYWx0ZWRfX/Ze1NOMVSp17
 dmzcoAZYscXtmC6cZfOXizf7+OUqTYBOco0Rl7j76ks6DIy/jSvNbCHsuZdA7Ss1d5B5TTpcvcY
 ++Ka0gcRy8n6TgtSKEenMQyaNj1qlOhFhzYOlGNMifMF6l/QSys97W5B9X2tty9lzPkIaUlakYR
 3GV1HKYwkXQGYGpvwW//5q3EoCPW1I9RKkU7iuol1Ju7X6W8Lk0X8poYGYuRl0YyCnhWJy9JSsU
 VREk2kKVGTbfa7P+8zNh2M7EUcRf/gVV/mraIpN4LUSo8CYzBF6XfyfqvSN7HiF8/RmjQbk9CR6
 NlFcGfPwk4yifL+s6BAHlx88WPjFZ1yfrNl/0+2MUoNFM+XCwPsKs6mT7UXrlZYVzxbdmXdb4tS
 psn+hKh9FBn8n/lPxnGtIIG+um0uPflaFBY/NfZnw/kcr91cVMkVFrLl1c8EQgs6zHOUKScrKNv
 h3absLLcHnlQipahGtA==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa42f36 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Ehwq6YvRiQ2Q07RnrmwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110232

This series adds the following:
- VADC and temp-alarm devices for PM4125 and temp-alarm device for PM8005
  which are used for thermal mitigation on Shikra CQ2390M SoM platform
- ADC thermistor channels and thermal configurations for same on Shikra CQ2390M SoM
- ADC thermistor channels and their thermal configurations on Shikra IQ2390S SoM

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Changes in v6:
- Rebased to latest kernel tip.
- Link to v5: https://patch.msgid.link/20260809-shikra_adc_support-v5-0-bf6882d18bad@oss.qualcomm.com

Changes in v5:
- Collected Konrad's Reviewed-by tag on patch 2.
- Rebased to latest kernel tip.
- Link to v4: https://patch.msgid.link/20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com

Changes in v4:
- Collected Reviewed-by tags.
- Updated the pm8005-thermal trips to hot and critical.
- Link to v3: https://patch.msgid.link/20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com

Changes in v3:
- Dropping the polling-delay = <0> property from all thermal-zones as suggested by Konrad.
- Link to v2: https://patch.msgid.link/20260709-shikra_adc_support-v2-0-8dda38f7bf3d@oss.qualcomm.com

Changes in v2:
- Move thermal zones to their respective PMIC files (PM4125, PM8005) as suggested by Dmitry Baryshkov
- Rename generic-adc-thermal bridge nodes to therm-bridge suffix (msm-therm-bridge, pa-therm-bridge,
  quiet-therm-bridge) as suggested by Dmitry Baryshkov
- Update commit messages accordingly
- Link to v1: https://patch.msgid.link/20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com

---
Jishnu Prakash (4):
      arm64: dts: qcom: pm4125: Add VADC and temp alarm nodes
      arm64: dts: qcom: pm8005: Add temp alarm node
      arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
      arm64: dts: qcom: Add PMIC thermal support for Shikra IQ2390S SoM platform

 arch/arm64/boot/dts/qcom/pm4125.dtsi         | 104 +++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm8005.dtsi         |  35 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 120 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 113 +++++++++++++++++++++++++
 4 files changed, 372 insertions(+)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260613-shikra_adc_support-0079650eb76c

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21D84D7D2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583481; cv=none; b=orkk58KF766arf2b/ZEx3Tq3u6K+Gw38osKUmhzF7NQF0hiYpsY36C0arB+xkFBuXn3+4IJChCZyYzNiQziYvwbvp4H1to8pqaNKKdGRRrPDbcmpjIfOAH4qYRt/BrRS18HM95Ha8zgIv3n0Vpupq7BEUfCeXyAvPHbz2dX7wKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583481; c=relaxed/simple;
	bh=6WFqMbsY5MFMYqlgynDA30nN++WrMEHFTWgw/+n3wAE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xh1PfqTAJBxs+TRzhVA4Rcjtg5mU28EBwCQzg1fFP41oVDSwzFCg1NDQKEgNXyEKJBZ2uZeNuMVjtoSm1LIbFVby4OcrEwOvX0evjeOmc3d4PIiogoqGNUsqPiqpcIiABbrlNGZuR5zzQMgpA/ghSAqRsfpbgNHfR+Wv0kcbH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSfN57Ji; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQxYUxHj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSfN57Ji";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQxYUxHj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GG5L2B3597322
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 18:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=v3gvRIGA/yV1xEyOwPDhQD
	5kTkCxuhUGXgr/bqpja1E=; b=aSfN57JiqDov2+LXnLsEHMyU+sKkGGpJyTGWIM
	wITMpOfFoM8endchB5r8vfr9ASRB1lDChTGd+lH9fXKOGHJueQtlipgRmLiR6j6K
	AmNI9/06ACMZ+XesVfMqGjPEZ7TxhKwYve2TXZwtil+gEJwalcUc92yaZxQEsfY+
	9xsXDbA4mylae1TMUd7JTyAXfBKUma0PpbZHNybtvvFqjlGFmyJuwdIxuUXdUOHD
	PzFjABYtj82hJc8c0MWlgd7XrqyzaiQIb/g7YoLv+m20c5GIXmiJGjIZ26iEDhLY
	23t0vhk/lad9/dQmskssFGeIf1aZZplBGBEHIuAzZGrFZq+w==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqxay8pqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 18:31:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c990236604so668253e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 11:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789583470; x=1790188270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v3gvRIGA/yV1xEyOwPDhQD5kTkCxuhUGXgr/bqpja1E=;
        b=TQxYUxHjr0rjBpT4+ddXOmxrr8itNJKmg2KWqFBQ+KzBHLIDK9lQ/0vqVcHvhJ9VCy
         Zwq3LbpL0w8nLT93GM67FUG8HEC4yU0+YULFyP7TaRrfpAH0DSCxtaqkk179RhNqis7A
         qQ40+/9wTQ7ArocA0RfvQa39ddfq5JPU8T+Eo6hoNpYSO8p29pB78VPXF2tPtrA5Edtu
         5RUcqVULEGGNZqNRevugW+Z4lrT2zsTmF3RtyZEY6/QAb1sGX3+oFhFJtxQo6OXoWDfv
         6c8k4BiLD2W2271Xaqb7K4ZOu5TP2Cuh9rBrlLcEq7yAHamJUY9gcpF26moamfZ+E48c
         Qt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583470; x=1790188270;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v3gvRIGA/yV1xEyOwPDhQD5kTkCxuhUGXgr/bqpja1E=;
        b=LNfgjtK5akiYom8M/nMWI5zB9UAGlEgJcuGfzJiOtmbrM3318/2En5tM+lHoES/5Xe
         JnW3Z3W0vMwf9iCdBYNbjSBbV03f6BvbXeR0m6clkHibuvyk7WmYWtQoe4q3kGpX1oVf
         mwBrihygjEJ1+RAHuciBZx2f4/DVZCk/O96sd4gQ20zaqjAn8BoU/+pI2FIoPsoBfR3g
         Ylg9T1A9+04v/9oYDZ03qbjTR6Zugg4YMdFKXeJHdNuH6N/zfuO/MRDvL4pc0mU/dTEU
         i6Qyozuxx4K+HA73xJ6YDOGo//+OJlRenLxBmfPbIHyAPk3qfwFQXhQKlrx21sxVBufo
         MqOw==
X-Gm-Message-State: AFuF++mzZywg+O81c7svRGeL+EvPOkUlS0y4lj5mm2UuSxUsjOhIxDsL
	LvJVwjMSYxAbEcnHiEbzn59BuzkL7OCjqzrP18i2EqA88x+9gXqgNPiwSKfMshYlaQqIO4uTbYm
	8CB5NyezMRI5dKCp+4mDQpx2b8MY+YHvmBBh/GaUaF0iDLR6SHY0NqxRiS91V6DjExO/x
X-Gm-Gg: AYBFou0QVWNhEUc6H2ivXH0mnp81ouqRzpF4DojDUw37LN++oL65AkPafRwcAaM9pgR
	UrMhJyqTj8CWe97OcPNUG0JmpDxVw6auB7FbVkHGJQfNONzD15bv6MsbcfrCZy9CRhEtxiR62kH
	C6uSKvibx/+bFZMsookneJRZdyDVeDTKFMx3a7/wOhASrW7us+6jZJVhiBBmma61bTe1++v6Tie
	PGvm5AABybEi51jTe9jXxFDYIF1QqeNF9R4AFXf+jWYDeNdfnB6bcWk+7pxYzY/vRClImUzCP0N
	g+qmvz4K0KffO41T3Bnt+aMqk6WkKxmNkvFgfKsWHoS0k33FazZVqAFKBZn+Nyje6C8EyLR7Ds1
	Nbc6vyjP/c49MzgBxlRHogKvCWJ0=
X-Received: by 2002:a05:6122:4885:b0:5c9:a60b:e5bb with SMTP id 71dfb90a1353d-5c9a60be949mr367291e0c.11.1789583470421;
        Wed, 16 Sep 2026 11:31:10 -0700 (PDT)
X-Received: by 2002:a05:6122:4885:b0:5c9:a60b:e5bb with SMTP id 71dfb90a1353d-5c9a60be949mr367165e0c.11.1789583469801;
        Wed, 16 Sep 2026 11:31:09 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm8625416f8f.16.2026.09.16.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:31:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] phy: qcom: Add USB PHY support for Nord SoC
Date: Wed, 16 Sep 2026 20:30:50 +0200
Message-Id: <20260916-nord-usb-phy-v2-0-2c8461bb30e6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFrgqmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDS0MT3bz8ohTd0uIk3YKMSt0Us5QUY3OzJLMkU2MloJaCotS0zAqwcdG
 xtbUAM0qRwF4AAAA=
X-Change-ID: 20260914-nord-usb-phy-d6dd376b6b53
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6WFqMbsY5MFMYqlgynDA30nN++WrMEHFTWgw/+n3wAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqquBfVzBHJbfCqkaO12bk15XeM7ldkyj+DPDmD
 bVq67wgUoqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqrgXwAKCRAFnS7L/zaE
 w/YkEAC7mYA8uMPgtdZSFoRCRwKj2MZ1A+5hLEUA9Ug3b5UGi0lpcHOtTZPG7d6kqRVGSPkED0x
 6iCBgew7V0+835N113sER9CTC+vM722xH329o3Fd50yzItvfqjjGQn/8MJGu4Zm73/8RG8hULsM
 A4axgIXl1qtrv8UkdFS1IIXCu45IyfRUuv0aOwfszZJ5HTT4JuZcDD4IaiNZoa5HvL3Lb1hzhEI
 zp0TjPEqHRyC507DzF+W3VyP/QQ//Dcq00QMa58uZ0TojcML1ZADfGixbgGllEtzf2wIWjKv6P/
 DI7PfSLnLww1dgXE8HvwddyfGzYSHHKPrSXEAGS7cFd/bZS6HMVvVBbvFLP9JklhQsrN72a2WJj
 lz7VB5v4Z3PYB0heIOHgL/aPpcmvyAh8erfPnBzA4iKAacTOYYYiyu5nxVekDFP2w/g7vNVtRi4
 jvqQC1cvOwM5Q1aZnspKarYB23znW4JTZ+1BSWzMOrSTqEICSRZ7AtM2JNFfZ8GWLA0xOb4S5kh
 9KdRZWGev2aGYvVzrPhK8USy393UCTeyupWJTRLFjENNEn/UkGGG66QA7Qr9q6KknF4vLOiUMcP
 iozJUvlnt5mPN78+JIUag36zXLqeT49WhLWsI+mQBH+aXTgo5V2FJoAQFUsotabT8d8dEqaE+0U
 3t0b6AlEYaTSi+A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX6LxUi3g4Ippm
 drJiMTCi/1o8o9DxbpDd8m6nBgkyOlYFBaVluvXhXHsQlGvoC/AovDN5Uo9Axdinow7GT3jZSSV
 5+LKZdfCL1Uhmmh0CLDazro6De45TDQ1iuRbM5mWjCdpiSBmLErbD1UIJMQ7fukZRb7RgXiXWGU
 Zui2CP7r/XiKNYd7SBda8mWOYlZ5XX3P6UpicU8au2/UCu4bksbzNvfyW3AmNn9iUW0S+tOPgkz
 qRkrbtljayfIAZyb3DhMVea1F5200OWWX+MLTXDQxm70hiRHQPVv8kirTom9l0BMRVquzYv1asG
 a7W6lxp2yP38PtOkvc/rnSfBM5fTW/u/Pfpq6/PXXWgdyfFLSyjrBPAHfc0A4duPOPeDaDXz1K/
 fM01T+uAgrYe/dbLSmu1PE/5MtsE3DZNVR9bLo1a0a4Yr8uW5SU84VO+n/+Kfxalgn+PpwC3RYi
 Hz+PIvg4agHZYgjwGtw==
X-Proofpoint-GUID: Bh5Tcswd2_UOKFpFedy0y62Yaw6FE0MP
X-Authority-Analysis: v=2.4 cv=EoJHPicA c=1 sm=1 tr=0 ts=6aaae06f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fYuUhxZzbo174WpB_3cA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: Bh5Tcswd2_UOKFpFedy0y62Yaw6FE0MP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDI1NSBTYWx0ZWRfX1LIt82uY0S+h
 ZAlhFVQBGc1ZDRnNo8twLcLnNd55n3qG6L0vsHf3aBOSVSahx+Kk29n9jHURNckkv3V7xj62DZZ
 VGJ/ALWEQIVPGqnSZYARvWRY11TumM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160255

The series documents Nord in qcom,snps-eusb2-phy and
qcom,sc8280xp-qmp-usb43dp-phy bindings, updates qmp-combo PHY driver for
Nord SoC support.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Rephrase the commit message in patch 1/4: drop any mentions of the
  driver implementation as it has no impact on the bindings. Clarify
  that usb20 PHY really does not have an external reset.
- Squash patches 1 and 2 for the optional reset change to make sense in
  the context of adding the nord compatible.
- Fix tx_tbl register values for Nord.
- Link to v1: https://lore.kernel.org/all/20260901095055.42229-1-shengchao.guo@oss.qualcomm.com/

---
Bartosz Golaszewski (3):
      dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY
      dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY
      phy: qcom: qmp-combo: Add USB3+DP PHY support for Nord

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |  2 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          |  2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 80 ++++++++++++++++++++++
 3 files changed, 83 insertions(+), 1 deletion(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260914-nord-usb-phy-d6dd376b6b53

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


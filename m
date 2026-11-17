Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897283;
	b=4aelnGH9boR7vTU9rOLaiTC1NFJT9vEu/p1gt4LGdQF90PGnE6mnVYlobsE1e5M7++jZ
	 wexaLXbpVrV6cKp4T3q+r7wTr9yuM8YhoZV3xVp11LjaSRuyMQV3UtThFulv3n/NDoAgT
	 GwDcEabzpcyfmGeDuRqIUrVhtUThCbhL+uUBWRQV37YwkcEOtYCCEFZ034TniJLceuru2
	 VSrHy4EwF8Ii/b0K0XUhnZSVrlD7cQUHMjOPQ7RaDOC69UBcn97BQVQ2jOEmCXmH2+Iij
	 zw9lPE7di5Kxo4j6i06FzmGcbBHgLslBr80baMHDdc3HLTmzC2Hfhra84UPcT9w/DxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
	b=Ann0HZbOVzHMhlP65kcj95Hobfq+kZmU7SBW3Ju0gLRQGyBCrS+EMaEn8mjylXEi7VWZ
	 GtZE5DL3lXPQ+hiqYGAfHTYuAfrsLvgqcxfp5k2LM4tDJSWHeMBOpe5p2aqqEtLXdlDgb
	 n6i0LiV7wrdq2MNJpYWpVoMtMzcjinfLNXV4In2Voakt3/4vOn3p2QNvGS+AgoKXgNRod
	 UDdm03Omwv1PsTR7MmPD9XPhsQBMNV58STFrCaJnycG5KVFT8lwRFkSl0kN2ZHGfnAUUF
	 vZ37qG2xiVV+77t9eEgwU5DtrZdqbML2HDBNzjKrO11cruqfFQcJeViQlZsxwYw7iNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kwSZRjBN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JUGCZvmx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C98606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kwSZRjBN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JUGCZvmx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH55e4O3350004
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/AXX8p4qj1qLShF67tisT
	sKUUeSf1IjIefQ6GJ36wU=; b=kwSZRjBNUVeNvNqDGMZa1Cc22BBpg/6/uho/2q
	dkOf3xBlTbhqeEBfECjVb15Y1Su4A/48IC0NdFKiEXiVpJ6BNHg2itEU7EKiRenQ
	GL0POp3QDQXsJcBUBFTnMJa6zC3FI/XmVx8HIn6bDP102pDDpyAW5kdxh6A+tuuu
	nskVnliDVr5XLlk9pdW34Qvyd0DpiRP9GPA9tn9g1LMT4GyFGOmxs5rTw1H+6613
	p8JTBbTztllH6H3BcaahFLJEWhtZXOI75pxw6gYaIGcTk3w/xw4CZg6c9L9eAgPc
	l8J2hFbHRLFFAkPDLSmkOBgVNcPTy0eaR8KbSloG2bnzXsxA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0gfr09fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8bb1a7b0e52so2916228b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897280; x=1795502080; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
        b=JUGCZvmx/174eCYATCACtre4A8Xn2abGOrTjRTp7dIRseJL6WemrgipK7Kyr5T1Y3x
         EiBsTqhylxrfCNbMrrbbW8/9k3JQ9FCKqTQMle3EQ2OucbAc6ZJBZWCh9JJM4EMyoARz
         Uzs9yu+GhlfrHdycNEBshzvCW9Cmw7VUWWM3qH4bCH4pPfOwpouPqyHF8gWWFdSIiSQw
         /p0Qb5AIddl7i0AUnsnZkF/laAGg6bEshjUabOznf9LAX4lpLANChgndPsXSDFRAqgpl
         Gb+5pljP6lZ4GAMODN4J0WEtQFE1gnImPxDrhuldv0Q8GonrOejEWzFzW0e7AIdVkrx5
         x+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897280; x=1795502080;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
        b=VlqQh/R3Ibv0LZPjA+pb/QLtNLqsuaZvIuK1E5FPL1ELgmnqCq/L+O8UOBxj8H5nk8
         CcS8QXBe3TueIkpiDPPg2xjyWPZjgHGIRTPv3siyN+FR3Nf4Fwy5ePeatC1yLAnD1ZKw
         POMlUGbfK2rz612IoeZAi/siM7uJw35WajcRisGR7Anj7ebxq+X3KYfEw/sxwGgbdnWv
         yN96bO7tGtLOpucQrKdlRcKBbMS7/tjGJQ0jtXAwkB1q2dNBIKpf76cCpYHSsTIS6QYt
         pEyNZlz8qTRYH/cplMNxj6X0cj/6tuhv/QnDrhasYrumn0tzJYrRxjhBwrxQtKGWXFXC
         FE1w==
X-Gm-Message-State: APuU4Z+RUVX2XET8rr+0o0eN3SRwcRqlBXFsdi7PhN7fykCQ4ky/mgoK
	mL5+sEaWYLgz8Ji7wEuwZHtE2CLZ/0QyeyESo4EBNpzcklhm87Cr4oDUb+nB8CHLd1c/scRqGeE
	3VO5gPixQmGSA921SqLEZuUXFnsK777gLPkYJ7ZGctLdrnJd6uH6/+4Gy+LCZvPtOKnW3
X-Gm-Gg: AYBFou2+f6RJN1EtaPAphL26WTPTG9gr8/mP8KlTofpj6wJKhhONCxFHYZ7pCmTxhvq
	ulWF2dJWJKpH/uZ1Wu5VLOowBisFHGSyhsNGUzFF9eKtnuUnG3Mnd7E+fdQtT0C9MW51+x1Y75P
	8ZalYsa1vAwkkjhnEdqhk8BzCtFPzYoymTS+6d4MFs4PpuHVuiD/KkKxGWqTSrz0XNd6GZHWT2/
	8VfRewRWpFm67fiBFghVtmleiIeODKzr2sV7GG8wY0lCQbyT4eryMLj+P3bPOnManNrcvaHEDC8
	52CKdDsAySl3ottAz+wn6cetb1Odk4uYEfqrtTKKQi/s9lpkLJK05Rn2DLokp/vY8obW/69g3RD
	4ocmCxtbnZGSEHl5HxBjSAFLNi3GK3UG5H1fd3B8XGdnPzjzoqC/sAOcBRjtnYH4fkqX20hB6Tf
	iaiaxDaqf6uyFnZ0dAsz4FwUYefJt+5VCmSpnOisUQHVhiyXMt
X-Received: by 2002:a05:6300:483:b0:3e2:8c8f:f11a with SMTP id adf61e73a8af0-3f7a87cfdb8mr10237683637.59.1794897280043;
        Mon, 16 Nov 2026 22:34:40 -0800 (PST)
X-Received: by 2002:a05:6300:483:b0:3e2:8c8f:f11a with SMTP id adf61e73a8af0-3f7a87cfdb8mr10237654637.59.1794897279531;
        Mon, 16 Nov 2026 22:34:39 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:38 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: iris: Enable Iris video codec on Eliza
Date: Tue, 17 Nov 2026 14:34:29 +0800
Message-Id: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHX1+2oC/33Oy2rDMBAF0F8xWldBj5FtZdX/KMXoMWoGkqiRH
 NM2+N+rOJsuQjcDd2DO3BurWAgr23c3VnChSvncgn7pWDi48wdyii0zJVQvrATuYpyoUJ1SLhM
 e6cfxkBxooa2zQ8/a4WfBRF8b+vb+yAUv12bPjyXzriIP+XSied8NYB1E1IMAYaGHkEYjJAbjF
 RgZE5gwAnpgd+tAdc7le+u7yA37r9oiueA4hhCtH0Ma3GuudXe5uuP9+66NTV3UH0nJp5Jqkkk
 4+MYJpcUTaV3XX1Hc4dZRAQAA
X-Change-ID: 20260914-add_iris_for_eliza-cfa43039a976
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=1929;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=KqHCk1CExbEQKbOp47126ICIyfQogaUNymyxYJPGKsw=;
 b=4q3NAOT98xG4yCsAzKwG6NOVTvRWSxj7o8meFYC7mTOIPXYiDcFLy9QzfHDIKI2VAAhAYNkwx
 pn2jCsh3BsICm5cORmG/9Hgi5pgbQlFJcnbA/WYiRHq1uWZ3dsKJ532
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=X/rHu2Te c=1 sm=1 tr=0 ts=6afbf581 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OT0-6WW5Sb5gBQYBlqwA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: QbPb6U6sHFvvhFwPLJ47reWLsvePKTD6
X-Proofpoint-ORIG-GUID: QbPb6U6sHFvvhFwPLJ47reWLsvePKTD6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX1HqxYvzC179p
 m8SARVSQNbYlLkDnABDEnHke7xzCQsbKT0t4Urkjh4JZcaBU5lMAJE1cJjnfrl6/f7VaGUS9YUi
 5DktO5sebIbqinkb8rPeTAh8xbdJ5Fe3fIphSKxBhWoOA54N6xdF0iQYoGAFSjbT9W0B4qwuIPP
 AanYvilFi4pWTDVMOic4G2lEv/+bfu/e4AJu0QDutJDBRD+tvkdVADZePJzvQDvki8XlHePbG1n
 EsryG46ep/NYCKqJ0rD+jy/DGFsPidjJQGc7029e3GrWwtTPSx1jLwvuTtw2WuT/I4NFKCh4G5T
 V4iQuAxmRax5SaWrcr+TiA8JYS3ugB77dw+XiYYXgM/nl6jA9NLfv3zWF8OInVKOeIOQ/YhZkBS
 FsByC6N37syEyGDFMLGmJSQ5vNPRYPPWhGWMsAG1GfH242NZDAiBiCpVcyST+L8oIVbQDq06gOh
 VlaCNsbBYzrDK6wS44A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfXwdfh/Yf0XPM0
 9sAAwzTcJ+Rf9yjGtn9qSoZXyDQ/P/cza/5uQPRkFIl7n+ER6XgVZ85l7lXkzWHobNJZrekLYkL
 2xC0n7ceTGLKVrcjm3bKCsq8Mj5Ptu0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

This series enables the Iris video codec on Eliza, allowing Eliza to
use hardware-accelerated video encoding and decoding.

The Iris codec on Eliza is based on the VPU3.3 hardware, sharing the
Compared to SM8650, Eliza has:
- 2 VPP pipes instead of 4, limiting the maximum supported resolution
  to 4K.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 225/305 tests successfully

Dependency:
https://lore.kernel.org/linux-arm-msm/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Rebase to 7.4.
- Link to v2: https://lore.kernel.org/r/20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com

Changes in v2:
- Enable iris on eliza-evk.(Abel Vesa)
- Link to v1: https://lore.kernel.org/r/20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Document Eliza IRIS accelerator
      media: iris: Add support for Eliza
      arm64: dts: qcom: eliza: Add iris video codec node
      arm64: dts: qcom: eliza-mtp: Enable iris video codec
      arm64: dts: qcom: eliza-evk: Enable iris video codec

 .../bindings/media/qcom,sm8550-iris.yaml           |  2 +
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  4 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  4 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 98 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 7 files changed, 158 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20260914-add_iris_for_eliza-cfa43039a976

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>


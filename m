Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4D3C4176
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790049415; cv=none; b=A31ckaRP2QHs/0sDFHGoniXcnECx4/z5P9uY19JzouoGGp1UQeYsccdKhL6P3mX9Mx06fzBjljFLVXWqIFIJbp7RILUA3CTHQbqgink1fAxXiUCwp7aP0gCFgKhUqsW1+PcROhfG5NvTQQ/TQBCBeKJNL0l5MzDl/iJ5gVbIAIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790049415; c=relaxed/simple;
	bh=YK3TT7WKL5RMUCoj4TBa5rqHfsVIwvvAUnW0bQ8mNJo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pJVioY08WLwdVdYnwQUszWTFMPSj7//6tnU1bmsacDzFcVlVDWLZTPYYVjjzrpB8qYeJW6/myQaVhbmFZuRL1kBWtH4AF09Vz9ds8DNVRL+VfcyOVlUBO/CXYppSCBHGNMl0f4qBzZY8ChaN6k/HWZ95HWVuBtzskuLxUDeqD6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WC1O8R6e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dNIa7l3z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WC1O8R6e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dNIa7l3z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M0ecFt3044188
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rGt/piOAWfePhjFhFu6FgZ
	8S+aOcUywZUKoYqsKXz+M=; b=WC1O8R6e6Oe1JXj92q9/NAzDjer7nkWEcPkmvO
	Pqo8EcWyvcrkEzA+v3II+LUblqTru8SVgGt/wNCJaRHv1M2xekkPwqYi3bnYFH33
	1R8nKhMtNZTGcwnvVFv6uCbCQEzQDfG6w5yrIjFVc6+DGTLqLEgHIlXxlHSSumas
	XcaZLsC2SHTnCecTVKqtWSWf2qpV7z6ry5zPqPWYu0B4UQfTOWv6EpJqXGSjiWxi
	NRDl+ccvd8KJxiJGw6j1iJmF3N/v/jxC2XkvKhbTFVPeMfr7dRM5OsWXlzaNh09C
	wJt0a99P5qBbn7b6vKmlRZEzZd6G9Tk1Yl1lbnGHwy9/B6Lg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbarm6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:56:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deda201bcso4971809a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 20:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790049411; x=1790654211; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rGt/piOAWfePhjFhFu6FgZ8S+aOcUywZUKoYqsKXz+M=;
        b=dNIa7l3zy5qnocucMo0woXzxrLPtloJg5gPLCZJuj+UEWM+s3gG77gqIe/SXcdNdHZ
         uwdHrnkmh2/URj9Xv3jieZ6oWugu4GncLiZ1O6pmIS3x6ZeLtX81Ax/h0Zxe+gpDmdSp
         uMkt0TEivSE88mR5mspjg6JoEYGbYV16aPyC+XcXUGldqQWkdELIi6bQxd+NyLMKQjGC
         +9Tuo/5HrJtgO4XYpKwcWZHHZLGITy3wXPUoBTQS1Y4Zl8yRaKJZbNbXSIEmvK9sfbgd
         +q6FkiLedOIcxYah1vtkZxpYOrkyqhEx5XxU8Qiy9YXtIDzc2f0mot3yMC9bQDqc+D5C
         ZlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790049411; x=1790654211;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGt/piOAWfePhjFhFu6FgZ8S+aOcUywZUKoYqsKXz+M=;
        b=qWzHo27kEXH4eTchB43rT8qyh6GVrBLyb7+Tjjtp4nEsCxOtojRCBENnVq0AG9H2Vm
         HjKLPmGJyH77zywh+vRpSwUbyReZOcBi69v+HyOv6aqPJx2sqblEOmVkWsGoslDJRSiE
         XnfJSh8m24ptgY/gcLKyVrsBZFA3vTZN5+6bFo+ZAeUw/YZ/vfeRpIFim644IqcFKB20
         7bY4bVsByZMviUrzswjy0KFk4W4/hTEYf9No1Q+A6pioooPgvAonuQ3ofecpclw0Wj62
         z6Y0m9P/8+gHcCLxN1uB4gcCPW3oeeDKN6yQchMjIdgmTFDW3K5QSJbYzqsP4VNF2ZEg
         Xugw==
X-Gm-Message-State: AFuF++nfh9GSS1kEd2LLOqvfstEEStSlOQNBWYaMIZ543vIACUdGCWl+
	fNcL4Xz05Paj/FMGOrOkqU+pzo2MjEgd3/C4CD3A8YssKBVwEmVeJEGv0hEjEmSY9RzWXAxyRHe
	EZU8sKWQld0OxFHDg+2KTx+s2hyCsc0AGsjsJMizcdlAH4/P76MKZsRvrYVnI51Opr6NKURtveZ
	8T
X-Gm-Gg: AYBFou24wFcQtgDu8a9lj08K4V4LVndEsgNsu57kNtwCnCp0QHvWDxaxU84XnsykOXd
	6lB/+IQbxIA8OFfW1LJ7tfHgpPBsuzjxYWHhYrk2IpjC6ZbTRTRLUs/MacSR/CXO4CMRBfgIauI
	F9MiGUv123boioT+iz+OgNiLCjNeRnnydfpVHfxH5RBCdvGSs5mUw66XTpm/BrwDUKShNBzGite
	MUol3nLupbPolaT7AOKVaoD7+MVQM8W687TH96CSnw66x56wT1mpJy9UwJKDOn7/c85f3AnbrA6
	Eqc8hqcw+vWH9NLlRYTgtfGHkNrBV5YYMECHRGB4Nos0KCmvQwTrdYOFbKE0q6+w1DDD3wNnplU
	vg/pl+nLRdnv9dM/2FnmJcCJvPFGNPhU=
X-Received: by 2002:a17:90b:1b41:b0:39e:6c68:c788 with SMTP id 98e67ed59e1d1-39e6c68c9e6mr12101220a91.62.1790049411369;
        Mon, 21 Sep 2026 20:56:51 -0700 (PDT)
X-Received: by 2002:a17:90b:1b41:b0:39e:6c68:c788 with SMTP id 98e67ed59e1d1-39e6c68c9e6mr12101200a91.62.1790049410917;
        Mon, 21 Sep 2026 20:56:50 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e58fcsm1613139eec.2.2026.09.21.20.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:56:50 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH v4 0/2] clk: qcom: Add camera clock controllers support for
 Qualcomm Maili SoC
Date: Tue, 22 Sep 2026 09:26:36 +0530
Message-Id: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHT8sWoC/3XOQQ6CMBAF0KuYri1pp0DFlfcwxpROK01AtAWiI
 dzdggs00c0k/yfzZkYSjHcmkP1mJN4MLrj2GkO63RBdqevFUIcxE2CQMwmSNsrV7qxVozU1qUW
 pi7TMCk3ixs0b6x6Ldjy9szf3PqLdWlYudK1/LhcHPre/8YFTRhnHEiViCTI/tCEk917Vum2aJ
 A4ycwOsRMHzbwIiYQUrRfzRYsb+EOKDAP5NiEiA3aEUhdKA6Q9imqYXwZ5CCkgBAAA=
X-Change-ID: 20260727-maili_camcc-e4fd7c94b59c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfX3yMSmWeMthQJ
 ZK7t2ivhk5BCD5ryzhANIgRWzxSekoinBACkWBXIGXjlF51tqRoTVFsGn14OlGXO5vfoZ/qbqzH
 DCsNR/ufU4kBsw+qvw8WGNNk73NFJyuH+duS5r0TVFcxzxV2lNUhcyu6h6vPdi5P5ABBc3FBb8s
 pjUVnpfqhLL8j5/7Bb/bTKIvoa8AHnJuB4WfZ8pdqPOoTek32fZ+29yntiJgHsaO7UujvKAhUTq
 SBqVj+jpwNJR5gviaFFvwPtRpC1JxSgcy4yQQ5pOr2p/DQ8oSVBkAo94M8eItb1uZ+R8VHvVnLl
 MPCYB3WVty87l1KuI5Xar1xvTIAupQvJ43IkolpYcB6Qz9cFT5hFd5+Hu3ZIErrAfNILo1NCUfE
 YLV7dgI4mmYd6G+BTcBxt6/phMDySFqgQd1W7O3Na7MwTGhDFnPczgfH12ElC4T7UXEmAvf/867
 l4hNdHMSkdLHHjRrXXQ==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab1fc84 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6kXFD9Q68pQua8COPXAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA1MyBTYWx0ZWRfX/JuHEpyRLaHM
 fDYrXM8z2bJBsv/xMvvn/NkPm8iRxMd/HtOJHCPacj/P/Ec1gUEkwMLy5q8RcA9LFMoIehvR7YT
 SycaEK+sb5w84go1B6SFFnUVKaI/YQo=
X-Proofpoint-ORIG-GUID: 5mepDe72bAeuS2Lupj69pQ5ahkYiitzB
X-Proofpoint-GUID: 5mepDe72bAeuS2Lupj69pQ5ahkYiitzB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220053

This series adds support for the camera clock controllers on the upcoming
Qualcomm Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Changes in v4:
- Took care of Sashiko AI comment[1] from v3 and updated cam_cc_cci_1_clk_src
  frequency table also for Maili.
  [1]: https://lore.kernel.org/all/20260921165032.11B1E1F000FF@smtp.kernel.org/#t
- Link to v3: https://lore.kernel.org/r/20260921-maili_camcc-v3-0-2f8d739ac2d4@oss.qualcomm.com

Changes in v3:
- Dropped dependency on Hawi camcc changes as they are merged into
  linux-next now.
- Rebased on top of linux-next tip.
- Link to v2: https://lore.kernel.org/r/20260916-maili_camcc-v2-0-f30b394bfd50@oss.qualcomm.com

Changes in v2:
- Rebased on top of latest Hawi camcc v3 series.
- Added interconnects as required property for Maili camcc
  bindings patch inline to Hawi.
- Link to v1: https://lore.kernel.org/r/20260727-maili_camcc-v1-0-01dbd7ddb276@oss.qualcomm.com

---
Jagadeesh Kona (2):
      dt-bindings: clock: qcom: Add Maili camera clock controllers
      clk: qcom: Add support for camera clock controller on Maili

 .../bindings/clock/qcom,sm8450-camcc.yaml          |   6 +-
 drivers/clk/qcom/camcc-hawi.c                      | 159 +++++++++++++++++++++
 2 files changed, 164 insertions(+), 1 deletion(-)
---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260727-maili_camcc-e4fd7c94b59c

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719583;
	b=wvx2+AGE5Qkilhsk+LatCtHZH4zAbmVCAlHg5g2wAGN6G/WpLilSQNSvv918oRj6Pxeg
	 R/7UPFklbjfstpZwrmRBkGPhmazZLcDf9xF6EI0NByAvDtj7UWZRkLujg5PvytdLobMlb
	 o6Qpvpgve57PCJRwUAeIRgLcqd9YRqSn1x8fUJuDrNlH2XlqdSJKO0ELD0zanbMMmid/F
	 9iHmPseNCLmmlbkKmCMUoCIxLFLBZQiWAqNkWYEIkpQCmiXLdDgaxjdd03UAqw1JiTg+5
	 gCkpbfHMrUA66gpi+yfbd4vz/9vzHc/HO3RCuSRJAKAssYEMITAZnBn621r+ohAAnQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
	b=wNdGVYY+vstXD0NzfeYEwaNzNiaTJa9dVwAyABMYtIXKkaUqc3q9n1OwgFTULyhmirDE
	 kBrtPKQBo75Hn6dydaxmdGiG9azRm2Qk2MxoRggneeq/20jt6s4O29nb9gZm1BdY+0s2A
	 ACQRQ1iJiKdR1WkoFgNJxA0JqBgcGP6iV+yMZxxGrmk9wFj8t+lmrTOHr5tMaxp7qMmG9
	 eoHORELZ95xP8zMTENofE40SnpJfsNTUsaRdepz+A2Px8YZAf7pN9hJ/dLMMG4GsF8BbH
	 3fWNZH3KfZ9MMtQK2UUg20wGK2b0uqCx9cbFc5zcxGFGvLbOyVx37JVxZBWRjEv3SYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu9Wzjj7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2uKOJtf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B51606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cu9Wzjj7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B2uKOJtf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu25R1847749
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PKnwJGn1kbNBw+OYy82caU
	/JC92cEMMnvBlOquiaj/U=; b=Cu9Wzjj7rorA/u6iXgCIiQ/SUnhbjxcPw6D0t/
	yzeHlTiXtf0S0fhhEG3F6gbCIHuUQlx+i+YHFzCB6PhjrA0adrp8H70mai82PMTq
	3FwFFSniXsdqIDXBFxDPvwHI9e3WK+vS4gL3WWXqmQgf2Fo7O6jXtDDGf8VNDDXM
	dtvdXPnjPDIkHuRb8VD6Q0ie+KWvtyx2r/DSja2F/Q3tyZHKGZ4R1W5at+Ei7KO7
	a9jq2aQN/f8y9gjCmwG4FEV4LcPcrnzKK+G9Z/rHW4hxuS2MIXIS9HZqi11WbM9g
	ZsmoTG8dX+QucmIdvvpczclncmDj77KseVifa0mP9rDtU6Bg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7tgjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 18:59:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so10472195c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719580; x=1796324380; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
        b=B2uKOJtf1AV0wfvdDz+dei5DW1Kf5asGqvbZKU8kjHeVSiCa7YUZhJBDGZV0YTti9o
         SvF9LDld6HaRVDLQCDT3QlrV8auMvxLtdIxK3jvBs6cRY6JIiaw4t3DNMdTYmsTLLUBM
         hFj/JOHzWxmW0d5D4CF1gesUghyIysv/YVTQbu9pcjq7JO9ECVTCW3hjS9BqgPLCVUpq
         k+l2soD/ZKhn9OyHGmcdueSHXseFDY+bRMVr51cW+ljxWWngJjUe462J/ZCWy+9J6U4V
         vAzC+kAPl0Hc5m44O0n+sKab6Rwy6vmF6Ux0HaiM0ALh3+/XXcBFQfuV2o0RyYCZtyx2
         2BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719580; x=1796324380;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PKnwJGn1kbNBw+OYy82caU/JC92cEMMnvBlOquiaj/U=;
        b=jVsL+bVBuwBZxnkTasQxAEUjCj+RBU4ry49BCEeCysbUaysiPi3WLNhPauURQISKNF
         Rlr7awLdMiPvVXbN2okykj/ZvvMUE3YbIvBtR8Vv3NQ2MEXY6lqLRztIMWmUSoU5dG25
         dAUwQfItMZmUV3Qx7Rqv2w3uIhiBJaeR0g4GmZBVRtM+lPSIRmfvYzBP8RdKTqyDWakc
         bjiz4Xe+paY+OtHKZnutf5SCysCxaZWoWTuR6YNARCpp3Dn9+6CbGTyXdZDJCQsH9zEe
         fMASE+OZTLDkQdTl0EXxMo/vY9Wl8+z/Kt78uk24ySQKxQss6j2awUy5PQCilxiJ6GYT
         ohvQ==
X-Forwarded-Encrypted: i=1; AL+hErHbzXtXjbaBfKvcR91EF7PI8Qh4W/Z4gyKPf4MagLd0ROoF7NvJ8kaD9vT4rsEFwjQnbHqL6YCr3bACFnAY@vger.kernel.org
X-Gm-Message-State: APuU4Z+6HHGA4Jr5nNUBP8JA0/K3EiVPbg9+Rud/La6AIR2wqR3ZRv75
	MVFgC5kO3FmyFqGgzWkfb4Y/7PjwSZn7ihgHi8YC6LAOVT9qceuH38oxcFnGQOD0NTZjYHd8RV1
	pTJV/G6QY+nIN3jSYJOibCxJIZAia4QaXUDqMDD6K4sQ6jj2kwcqhfUyZq+eTWQ+rus7/
X-Gm-Gg: AZFdTZdJ6tt1eZf9ajQ6NacUa6puq7cI42gy9zjFd1vEbnjIy2Xeioe9+ZPC/RqBzQz
	SFkrDnB6tIW0W0tmVioq1rNKspyQvinmjG0HR9Pu7V4bLnFVuj2bvnzOkFrPR1Ld1LlSLNOXh68
	l8i3evxF6c4dhog9b9NhXMx9y0MP9ZQyI2t1pR1+SO2vG7uig8OwQ6I4IiitUvjqzixvhqNRgho
	pUVlGkoxal1wj7737fzTZNVcFdNPf7A0C+dT2aFI0e2Dbf+VymgDbsy9A7H3mrsNhTivZFzPGNc
	qctIcfMLX45O4WjOYe0HdMf1Mv72euWtMrP+9TXWzif487Ggj3zhThi3PoCxyBRqH3e1xIAfIUh
	7xd3+1t56vTptFTXeATyzezzXHsWX8VC/jeAVo/k3NyPNpojvd4brikYGA85s35Q6fGyjjJI22U
	6EUnp+
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr25262173c88.12.1795719580017;
        Thu, 26 Nov 2026 10:59:40 -0800 (PST)
X-Received: by 2002:a05:701b:2814:b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b5568bcbb3mr25262137c88.12.1795719579488;
        Thu, 26 Nov 2026 10:59:39 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:59:39 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 0/8] clk: qcom: gdsc: Allow USB and PCIe GDSCs to stay
 enabled across suspend
Date: Fri, 27 Nov 2026 00:27:08 +0530
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAASBCGsC/y2OSQ6DMAxFrxJlXUeEIaiseo+KRQguRC1TnFRIi
 Ls3QDe23pf8/DdO6CwSr9jGHX4t2WmMIG+Mm16PHYJtI/M0SZWUqYJADczGInQtGaBAM44tlPp
 +N6pRaZ4oHm9nhy+7nt5nfbHDJUS9v0I+IJE+9RW75DKTSRaXkIXKSwUSZqcplvC9eD8mIrEE/
 THTMIg4ji+NJoQjsL5iI64e/jULXu/7D8gvyVncAAAA
X-Change-ID: 20261126-usb-pcie-gdsc-suspend-7a99c6b62406
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX6qc+WewOu90J
 oCToSV0UaVtnRnn7LdGbulBJjpIeAfcIb44O+r2Wqb810Zo+WmOViOR5UmkkH6eH+8HXENO5uRn
 X5qJDtxXMhZodlSO+qgygL6D+hYwRyc=
X-Proofpoint-GUID: I3bWW_BrNUdPTTW5Bxf8XO3ZJsPgQudD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX8bhrSVoDr0a4
 nxx3wNRAV0syNCty7ZrQAAP90C7892BJEx6gy/hqMrTcXdjUG6whM6ZsI6nFvopTZohs4lU/y6Q
 TGYjoki/NuszzK2bNn/75QKTmKipw74cabb+fsN0e9GJfD/tyIeeErou85DIoQlGsjkZE6g03Xg
 4X/soxJ4xKFq8Df10sgGPF1Ey1aIU25T/cmKXLtOEJbv+2dkJ7mIcXCXEmhNhSd65wXZw80HWuA
 lX02mO8MMr6l68uS0o2t39dt7v9T5GNVh/tp+l7XxdPCj7qOiL/YfEDD3YXskyKXTB8UnOGZ1wf
 9TwgXlP3Q0w7s6eViS8V3qHRAs3ZXmv5A0xpc6hJr1tWO3b/IlhwDMHSOoqOak07z99aoc3Oj+b
 teNOjaWzXIPJZJmgMWN+Hpz7P7k/0Fi1L2qE2g+aTOJrJmjOFVps3mXjlNx5AjWaB+A6QlDaUsI
 M10J1EZZFxPyo5b88ig==
X-Proofpoint-ORIG-GUID: I3bWW_BrNUdPTTW5Bxf8XO3ZJsPgQudD
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b08819d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IPO9h8n_qQbs29NzXk0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260074

USB and PCIe GDSCs on some Qualcomm platforms need to remain enabled
across system suspend for certain use cases, such as USB host mode and
PCIe non-D3cold. These GDSCs currently use PWRSTS_RET_ON, which keeps
them enabled after their first enable even when consumers no longer
require them.

These GDSCs have a HW mechanism to stay enabled during suspend while
allowing the parent voltage rails to turn off, with HW handling the
parent transition to active voltage rails. Use the existing GenPD
hwmode interface to let consumers request this behavior only when
required, and clear it once no longer needed, allowing the GDSC to be
powered off when unused.

This series adds the set_hwmode_dev callback for USB and PCIe GDSCs on
Qualcomm Glymur, QCS615 and Shikra platforms, and updates the corresponding
USB and PCIe consumer drivers to use dev_pm_genpd_set_hwmode() to control
the GDSC dynamically.

The clock and USB driver patches need to be picked together on Glymur
to avoid functional issues, since the existing RET_ON flag is removed
in this series. This approach can be extended to more targets in the
future.

This series is based on top of below qmp phy suspend/resume series and
depends on it:
https://lore.kernel.org/all/20261113103111.156476-1-prashanth.k@oss.qualcomm.com/

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
Jagadeesh Kona (4):
      clk: qcom: gdsc: Use GenPD hwmode to keep GDSC enabled across suspend
      clk: qcom: gcc-glymur: Register set_hwmode_dev callback for USB, PCIe GDSCs
      clk: qcom: gcc-qcs615: Register set_hwmode_dev callback for USB, PCIe GDSCs
      clk: qcom: gcc-shikra: Register set_hwmode_dev callback for USB, PCIe GDSCs

Krishna Chaitanya Chundru (1):
      PCI: qcom: Keep GDSC enabled during non-D3cold suspend

Krishna Kurapati (1):
      usb: dwc3: qcom: Add support to keep GDSC On during host mode bus suspend

Prashanth K (2):
      phy: qcom: combo: Keep the PHY GDSC ON during host bus suspend
      phy: qcom: usb: Keep the PHY GDSC ON during host bus suspend

 drivers/clk/qcom/gcc-glymur.c             | 46 ++++++++++++++++++++++++-------
 drivers/clk/qcom/gcc-qcs615.c             |  3 ++
 drivers/clk/qcom/gcc-shikra.c             |  3 ++
 drivers/clk/qcom/gdsc.c                   | 21 ++++++++++++++
 drivers/clk/qcom/gdsc.h                   |  2 ++
 drivers/pci/controller/dwc/pcie-qcom.c    |  6 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 14 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 15 ++++++++++
 drivers/usb/dwc3/dwc3-qcom.c              |  4 +++
 9 files changed, 104 insertions(+), 10 deletions(-)
---
base-commit: 47588e4c16d8876d3058bcec030ed8a016794b9e
change-id: 20261126-usb-pcie-gdsc-suspend-7a99c6b62406
prerequisite-message-id: 20261113103111.156476-1-prashanth.k@oss.qualcomm.com
prerequisite-patch-id: d39d8cf075595b668e85fbc6c3cf7234c318602e
prerequisite-patch-id: 5f7421fa9312a84661ff4a87e946f315e8dc27e8

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>


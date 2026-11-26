Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719619;
	b=UU5EA/IQYwhZdJGE0qFtKIElAcc5l2vbza17f2i6UthwmZYZT3m+MFe+TbPULYdkgfHM
	 810c6RIW/UsCI6mRVBuB6rhDtEB+sn5SdKH2rEckFpnZa1B07n/TqVmxvpLYtZs6468ty
	 cFk6+DaoToT2GrwRXYHBB76G6Ly1DxJezoBvq8gpRUOusOK2jYaG0bl0+lPDPOIXNhUtY
	 EirsZwjfWf2/X8fckIMPRjoQUPz0JUE/TNxlqDzt6lGvMsOiFRS14KMIzACo9Cx/Q/oQx
	 acIsuk/7BsBG+g6sSdrzLwqWUcob2Ai0Sfjrdg+42SnFcY2xPGeCpWBC+2OVh0fS/pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719619;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
	b=PmKFRmwMkg+GWnZAmty5o4Chj3QCMy0KtDobY+PRf+L5XEazCJEiiONQyasj/NNeT5de
	 1q+jNJS/zenaFDLai6MFAB3DYK5LWr4uMGRvhxbW5gGi6arhX7VWcpmJhP3gBYtgIoEfw
	 i1C1FaTobdQMxNCV1Q6qXpM0wl1XrmXCl7dZPzx7un6JJKYMFxx/9BPUCEx6BpR0MhwGO
	 Ep5MaYa4F1MMlU8rBDCml14S8/bqGpoCnr41rdQQopCmgGSsjDUtGPOgzeb97uBZZxh0e
	 w8h7QKU7bANVLVelF/LxuB7HyQ/mJWVvly3Cv2dvzWeijaksHNs8wiT43lcWVPE27dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RORMn7lU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5785ACR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC52606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC52606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RORMn7lU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5785ACR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu1SP1847744
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=; b=RORMn7lU6cjZUu9n
	rBkXpGhdt03vuQ/8JNw4HTz9VLUfhi8wsI2OrO0yC7CFvPDJaBQr99JQ9Bcj2Maw
	CT/w6cFZfk9zqdByUUNYzlqh88xjQ0OzDisuhWy6SUrebwr8Ai23u54uPukPiA9x
	AfDDx6k8S+uVwPRjvPBbbh25yEAr2EvqydMDhHCrf4opCii9eacFe/AF2aP+icwM
	7Y9JwUinzImZi5wFyvXuImg7fE58GMr2r7OJYntRjSyEXF4GE6dqIqW7AZvjH9yO
	9Hbz5LrBu/tXvxH3zEGvSSxHaO0w64b6/dzvvTR/vAJwoXuktMm4xitYSG1vI3as
	qnS6jQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7tgpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so3601333c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719616; x=1796324416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
        b=C5785ACRL/xE3g+whImGQDFsgV5aWS34tPslLonRiK+ZpOSAZzArTXeB4nkjxQtgoX
         GJC7uITWj/gM9jaHn90/hLejBEi7qTWRyBnI/brnTbgun5ZTke4qIC2tfZwUKNv/xJLU
         2/RtgFjXUOuOhKWnZhxqLWXir+R7ZaMGfVvRxfMgW6DMdTDjFQlhqmrIV7ItEAwhPwV3
         o2J31ENzpK8ZP6+pGzqk1vzqG0qn7Ba9VWFwdZgNGyftlSe+J2IhHJb09Cfi8qPtRY0b
         UTsfiRbUF1lx1QjryINqxZpg5ojJLNYE1P6z3wnDEHvi83UXtvAcNJpXiysmh96tmLoY
         kp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719616; x=1796324416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IOae1sTZD6d+T98tKBjA43zUCmiaBBmOoNmMspUZgU=;
        b=kr1fGBNUuhKBfFbdrHcIJLPaOv+myGnmAOuWSWgfm8sFb8EFI7S+n2uLMiTu4Pre1T
         7pPawqbL2ZnNJHwkxkKvtu54vlIYdyPOlNZq/pt7qDmKQpiaXJSY/VQ+pS6iApi2H42x
         zEmlU3mXf52gXrYGsaURFOMq8XBWhj0iIK7EDGG5EJvWrzG45R+8n4VUHSTsctpEycEO
         8NrjeOFHo8yYr4uP4VkV1NmxqkqrlXE2Yb8FouySSo4zvCShhrpa/3DcYEazqo8Zzhyc
         VtltbyJ/wubN053GVufjabWhWlX6Y/cK6usel5ZGQJg5wcjMLF3rQ3JTxP7kuCGYGJr5
         L3mQ==
X-Forwarded-Encrypted: i=1; AL+hErHpXk6Y0AxaPw17kfdWOJ/aDHwwUYisWM2G1qBjosrsWj689xH7Zh1srlZ8f7rEyvETgmwH5SgLqRBk9UjG@vger.kernel.org
X-Gm-Message-State: APuU4Z+sgRSaQ3NbL8q67rP4zWqiSyq6Iw0QEM9bAM2WcwhIos28a0T8
	yJrsUzTSRvBT55FY0nrRl6Kw6TU5vrT/3256Tw54uSsOhfHDWEguavw9MfBgoDcI9Hyzs0uccOW
	IH4zbOo45XvCga+5jtdKGL5wDNR129q3qAOUOsRJ3mtyhQ2AyaPnjj7TNH7eBdNWJCeA8
X-Gm-Gg: AZFdTZdyOZu87UC1OM8tJfmZjXy1T5EknEzbbPqzz2os5dV2mlBqwsajVrj0tUO+MZJ
	+shAaUmJtcjRlSe/kTyZIX5hnJxufU9lKUIdYmtlzbP9DZOwF2abqs0i1GRMwWVseuGKWHX31vn
	7UkhlIiXO3NkbaG9CxhEyipCmEsHE3Ir9HH4/LtzCCPZfLFnWtUbZDUYGkZQ+sN/apF9wLU6Bfm
	Od7tWVjackboMPYC93jT68KkbJIYF1egwMJSHhJdcFcOLN2GvC4epbuuZBkiLOnz31YYCnhCL+Q
	/3TSpror1TBhXZ6AbgBPI+sSjMUxKqm1rti21dicVXU7jt48VSwMDOLPQ2l3av8boMY4Pnq4nVv
	j1DIyqn8FEWijcR4dtTDwZbxvqqatMlTQGEOk2SUYuiZGVAOq2J66hUi6avKHa4kI4v18LEmfaY
	xBjAEN
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr23745137c88.31.1795719616395;
        Thu, 26 Nov 2026 11:00:16 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:1b5:58d:fd9b with SMTP id a92af1059eb24-1b5568f03b6mr23745075c88.31.1795719615743;
        Thu, 26 Nov 2026 11:00:15 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.11.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:15 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:13 +0530
Subject: [PATCH 5/8] usb: dwc3: qcom: Add support to keep GDSC On during
 host mode bus suspend
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-5-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
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
        Prashanth K <prashanth.k@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfXwAs/0T379XlW
 Pq7NIiSwTfzvWeeJ5hfK4a5IFdFjI5cqrmCgH1ox8SAM5+cInFj3fl0mZKSO+HRhreRjar/RFsU
 hpIsKuR7bhXKlonbzerkr5UAsIlUYMY=
X-Proofpoint-GUID: vrkFcEarceVL_ZNMxGcVr0N_fTS5r3MY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX5qUFV1BfTr+a
 fBcpPOydCnyXsz8OkoVZCCYRLtO9NRpWO7XMeJhHzjcDJzBhvYmlCu/V23gC6KHG/YWLIo82ITW
 LKnvVMVDd/zbKYCyv02Swjpx3PVzcp3ZtYBYBtfnbS5A9bNCCFcUEOaGHeVV/oJwSLM90EjAzEI
 i5AND8nnSy6ud1KpjSfiArdH/f9U/6kdXbnR3y5GK3CE8XecsT1vBj8gLQY97dIxQl6bJR9GZHE
 bgYPgPHNDT3GI+RFJcmu9DyIBUNcfrDcTS16/8QgTubVavhXluaHbMK8QFgUBrqM75Ne1O3Cf5A
 lMnSJ8LPLXCKBnqENe0rDmNzDwPAv1LiCP5q5RObBBYTF1j7k5y8sGLI6Yi/y6DmKTYC5wEiy/9
 qNNSmbYfPD0LhR7PcjBE8vuv+unYEF8ryHdDCwNilUR/dOK8ZJhvF37Ig5s2GU0XkjhJMv6wtrz
 dIghs8D+ZRLwtEkS4pg==
X-Proofpoint-ORIG-GUID: vrkFcEarceVL_ZNMxGcVr0N_fTS5r3MY
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b0881c1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=g78jQFkTSXp5-VZghQ0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260074

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

When we perform suspend in host mode, there is a xHCI crash seen on
resume. During bus suspend use case if the device is wakeup capable,
the GDSC needs to be kept ON to retain memory and avoid SMMU faults.
Set GDSCs hwmode to true to keep the GDSC ON during suspend. And set
it to false to ensure GDSC is turned OFF during cable disconnect or
non-wakeup scenarios.

Co-developed-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 5a68025ccea5e5df8860f540f718262b7d8acf8c..99dce28dda065583b91ed965d917e977519cfe58 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy/phy.h>
 #include <linux/usb/of.h>
 #include <linux/reset.h>
@@ -391,6 +392,9 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
 		for (i = 0; i < qcom->num_ports; i++)
 			qcom->ports[i].usb2_speed = dwc3_qcom_read_usb2_speed(qcom, i);
 		dwc3_qcom_enable_interrupts(qcom);
+		dev_pm_genpd_set_hwmode(qcom->dev, true);
+	} else {
+		dev_pm_genpd_set_hwmode(qcom->dev, false);
 	}
 
 	qcom->is_suspended = true;

-- 
2.56.0


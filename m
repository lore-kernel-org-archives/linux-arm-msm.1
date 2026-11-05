Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873760;
	b=ChnNYQZ7uWSt02XLJiCd6ZWK8KeiHoOOC3zKVZkG+8yCYmVCgwdGJhHTNXQjNk5cm9XJ
	 By153lfgb9luJtEGsdRgxuQn02YwB0vJwlPLqW+mr7kzjLgmLBqZGEwTWTRcqJkj18wuc
	 dcpzlcNqMUI9ivjBWub/gssDibnn57Hd2VtH6FxFMYFmzc9Fd3wn1TI5hk9ZY8ycXZfyW
	 OasdzR8F3QQLcnpSgOxyKi+qEcXjeFxXEPJfbDdfQD1bcDl9Hst6Ovb23K84YhMppYT9m
	 W6myg8/XhSwXFsJWM1MNWuoQKK/+Mt9IquHjxDWM6s4VqLsxykcvSJxM7/g6VAANUcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873760;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9fvg9+ork=;
	b=t8QrCo19g8gvunns6In1WnBzygKmqzutC4WA9aBWSVNFosp2lkEB4M7kjZ6TOsy/pSNk
	 y+4oyI1aqekzgwGe+OIch0pMzRpKbv/jU5m/ZG2arKjFsirbfH0vHZVjmNHJzv71xATBh
	 0bQkDvUVt0nAUbNcJ7bd0mD9itDCj9k3io1ON1oC23c0nnTku2qErqAoCZgst7uREs7UA
	 e4Z3uWUvDA0Kr44Yay6pN/iVtgPeaWh4Kjzo3HTLDwt4A7yA+sRiQJd+NH5lcXIYOF0AO
	 DKuol1PTSgjg9Y+E65ebDTx/X5e8CxEI7qizYy/WhWsB12UVEPOEwTeUBH5C3vb1lBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMReMmE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUcZgWkg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1CB606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1CB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMReMmE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SUcZgWkg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tIfC1477093
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9
	fvg9+ork=; b=IMReMmE9YwT0NbY2NpYhYrw4BX7aFXtdbaCFMsCCyPXzAY6Bces
	9vMWiLYdYn4vh/mNvIwBJqKI0qTVXB1JMSR2CCLjnHmcCM13xYSi8IzLE2K75ZGA
	M+mf2UKfwiYYG3W3eXpU78w52bNM6ykaS1w46UGEjW+iQ/CR4inCgdB6XHjLnnAA
	vS80EAGYrytOiwUwF2TFpHGEeenXgS2GRiC1JA1JlzDmBRtNXj7lS6ug1yqFORwn
	uFbOsXC/z6ZIpZIQoAX/GcftvXMLQen99/4ahos0hcCnXqPuY5+qc5ihM32i8zdc
	88OTq42pQJZWMsH1e4Hoo0RCa1O5az1pfMQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnmgq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:15:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so1654178a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793873758; x=1794478558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9fvg9+ork=;
        b=SUcZgWkgyx3CAdh83tx8kQAf5Zd/7WHKxn/h7qUfJnIBAgMkBfZSKrSwRZfjjm4RXB
         8BTg7NE8y1EmRBEr3UjFW++kjZIuGINBKiEWthBKMYtSb/cwMWdpDF9ooJcdmk9KZPZc
         ideZQZjvxeTFleUoY72b3EuCOLDTVcK4Z9eLVNrlXiwrqvQVqf+NIKrhXH4trAxEfQvK
         9QKaNkz60so7IIQi95SQgr2XbbQHIEbMDQJT5kLo3zu3AB3mpbr2ELO8hfmMj8IEtLnN
         hQrO9KjVb9PwlQMltZ/lQsVbdT05ZyhPMjSvDye9k7CzabeCVZjqodmi1N50EzxDvB+d
         TgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873758; x=1794478558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du4ZHb0WNED8SK9t896iiYWnwaWFQnoc2q9fvg9+ork=;
        b=jBTw+l6QUXVqfk6tSbWH4vku6FeHoW5YNBOdvgZohZeWZzxMZOX2vCJkfOemt9fmcx
         HFfhCg18CHmIT7E/gZhUh2cClDW+BIKQtUdCRGVHjjutXFo6ZPK64A/Ek1lUqkfLcA/9
         Gd7bV9LzD9iPPc6HJRImAzFZHgjib3oYTZZYxqwAmMck4mQevnE4kkEM49beqzqZS3rA
         JzVT5oGGjTYVJrmLRHujHy0/YBHm4KB2EAAI10qtRQ+BUtNEPaBtG8U50ARDhfJ9LbO7
         tEFQAMHe2n/VxGbGm8ZbCgw+u2kI4dg4W/oGt6QUx6W5c1r/DqX9HZCGDSkwp3ex+e7u
         kNIA==
X-Forwarded-Encrypted: i=1; AKwUvByEL9Mc6kNAEE+1iu7BpzohTMZNLLQeLbilGeZt0vLQzouso3pqmYtHfK4juouU0QCJv9aSR+o7RhA3tgZP@vger.kernel.org
X-Gm-Message-State: APuU4Z/yVZPDI6fROHrEYMX/Ikn/J7PnOXyVK3vnCuMS+6RoWQ31eac6
	02VlMzkJZacfi0eyAhI//Gpxx683MeguDz4FVt5BRqZ4mx9WZtJlyzQiKILFpjLzxHsmVcmPp9Y
	2k/0NOWPFZGmniNfm8quaxF16rX3elg8unkmX+WT4Pdbs7ymcGA+dRIy6vSU7Vd0m1uvP
X-Gm-Gg: AYBFou1tWrnfRydNd/COTtOhNJkhrp0bT/4YyXAqVi1Z9zQzbxLcGBfmasO3BdCBPOA
	/wUoKPn7U8goylxwJqcbC1vBcvS0e3ZBu0ZjpMdxCGwT2fU5sYZOGcEumYLMxQ79pffs4/wLJ3x
	O4ZG1jKWi1qhtF/C26Xtn6GUQf9BWqEQexRHAtFHDK6xMcnOhSNf29a24YPpIxXt8brdc1OZyYg
	uQsjFlrt4aC4VEDqH57x7yuZChg5aI90vuxtT+S6MSXHf5OpmkPTrFsxqu72vtzX4naz+T22ASN
	8AY+fULi/6kmdjr3rP6LcuymdpimnTX+K2me6GpMwK9mK4UuriUz7l19GYqzVuY4Bax/kC9u5oq
	4oq64aI8dTtYAOWWi3Wd21Zi7W9H9ZaLCWMXJqzZmMubHFf7dz0PHghgPa8uO7SE9TQ+5Y3MNvl
	oeCWQ6eg61MDk=
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr13699088a91.48.1793873757954;
        Thu, 05 Nov 2026 02:15:57 -0800 (PST)
X-Received: by 2002:a17:90b:5243:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3ae89806353mr13699063a91.48.1793873757320;
        Thu, 05 Nov 2026 02:15:57 -0800 (PST)
Received: from QCOM-yK68p0sug9.qualcomm.com ([183.160.126.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b099189fb6sm4027532a91.2.2026.11.05.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:15:56 -0800 (PST)
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
To: mani@kernel.org, linux-pci@vger.kernel.org
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
        bhelgaas@google.com, krishna.chundru@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, deepti.jaggi@oss.qualcomm.com,
        yadu.mg@oss.qualcomm.com, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: [PATCH] PCI: qcom: Power on pwrctrl devices for firmware-managed hosts
Date: Thu,  5 Nov 2026 18:15:21 +0800
Message-ID: <20261105101521.434361-1-zhangfei.gao@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX+NpyXsCLsMHQ
 NuIxZyIMhArDw9NXLGD71gtH+gFmKLKdcfXMZz+N6hdS1yShzEGk4gxMGcra+aJGlbYCMk0nPll
 f575gXjpRsQKG+Qa8Zl9XxfN7I0Hf447fqtQviUhhyWusPyKYIgmpzSCAWFlZFXeEE5YNjS6+GI
 JmD9GtZHbmMzw1lZAMtAuNgDM4c6btVXOEsJhLomRreqpOV+WsFm9PZTVOmeh/zfXneADC3FWAO
 QK332EiV/tI92j12lTYrAR9gGcYcwg3KaW1OILGOZT1CGfHCXHoK321hzC15uo8dIADRasyHu5I
 X/miijPDXclm/b/8gyxIxccH/c3dDVFJ/m3HGy+q+dZM0jzlUVWOI6Tq/ye4KQZ7gfkaovUfzCP
 7lq8YxyuWNxov5hXT5KE3jI3A3r9twHhd1zQdFP5GUsh6jRDcQMgyGeLzrbGIPc9QTFdClL4h2c
 il6Vpq4VkjyM9OLFVqw==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec575e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=cl6WQ9rKrKu23RIucH9P8w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CABk0tZIDWUp0Uuloh0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: fcvVX1MUtq5Wy6pYJMb63zbZuTGJE5Fn
X-Proofpoint-GUID: fcvVX1MUtq5Wy6pYJMb63zbZuTGJE5Fn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MCBTYWx0ZWRfX65JLvIOwofSi
 W2NPGdsj07KhhNBDAVSgQq3Hur0CKeY+sxnF6eenwFlRKHdQ3GAvT9+PIaH1MWj2Csg2eJ4KLFc
 JwoLdPvWAORrE/8wPn1cA8EU34UtD8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050040

commit b921aa3f8dec ("PCI/pwrctrl: Switch to pwrctrl create, power
on/off, destroy APIs") switched PCI pwrctrl users to explicit create and
power control APIs, but only added the calls to the regular DesignWare
host initialization path.

Firmware-managed hosts bypass that path and probe the ECAM host bridge
directly. Endpoints already powered by firmware, such as NVMe devices,
remain discoverable. Endpoints that rely on Linux pwrctrl and pwrseq,
such as WCN7850, remain powered off and cannot be discovered.

Create and power on pwrctrl devices before probing the host bridge, and
release them on errors.

Fixes: b921aa3f8deca ("PCI/pwrctrl: Switch to pwrctrl create, power on/off, destroy APIs")
Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 0d56051b5de3..7313acd7e480 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2308,11 +2308,27 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
 		bridge->msi_domain = true;
 
+		ret = pci_pwrctrl_create_devices(dev);
+		if (ret)
+			goto err_fw_pwrctrl_destroy;
+
+		ret = pci_pwrctrl_power_on_devices(dev);
+		if (ret)
+			goto err_fw_pwrctrl_destroy;
+
 		ret = pci_host_probe(bridge);
 		if (ret)
-			goto err_pm_runtime_put;
+			goto err_fw_pwrctrl_power_off;
 
 		return 0;
+
+err_fw_pwrctrl_power_off:
+		pci_pwrctrl_power_off_devices(dev);
+err_fw_pwrctrl_destroy:
+		if (ret != -EPROBE_DEFER)
+			pci_pwrctrl_destroy_devices(dev);
+
+		goto err_pm_runtime_put;
 	}
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
-- 
2.43.0


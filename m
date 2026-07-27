Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570733B3891
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167250; cv=none; b=jtKkEZ8WZFymeMZEvWHWwMShrsD4FcGbSdbPva2AdZkJQjEpLFAFVkETjO8HwBfvjXzaZmfyaMm73wR6YgggCcvLEM5dovrFXHQCkYJ8u1iB/sPL6NXgSj7rTVfhmvG0c8DtAAdh0YRT0/PkF011ZO+h/wae9NN8Qngs42UtLB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167250; c=relaxed/simple;
	bh=Mp1h9YiBAPuohwfB0HWl+IqYzDtj7FFJ/tWPt3L6rJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+uQkltuVbWEWgmuo4EEFC+gMIN4RXLZhboiYL4kjXIFQPsnvUPnYDfQVc2duRth0tyUa+tHD2B47a1hqQPgta0Mrfw1oGKDHDOaoVdSONZ28OCemPRBUGfBMQD12JsTELWCtWHEqgYKDQ1c0fW1LPRDQpynOvegdQFHkteYqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WevY7i2z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i04mAkT6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WevY7i2z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i04mAkT6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWBj3663468
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZgdZmBn3IQEwWFZORtGOAEY2N/1tVUq1A4uzZFbQxg=; b=WevY7i2zAABBesLe
	7rGFmi+HthAScB0HHbi/KEObFg0cCDcCiUO38Ppcf+bHzV+MnZbaYjvONcAMsN0y
	hETiNC6khYjFhS51asmK++wrql5mxeGNsVLUcEE5P86rCOX5sz42zfp3rIOv4sqN
	fcSlhv6zGO1d7/AnY8K5zKDHsJ4WSLpv61DIRuYf91s/2PkZjMFreAKGLNnBWm0D
	+zf+l1KU3FmHUY83T73wAHRMVSzunWR8UqtvnffCh90WCVUOHjyTXMYFX0rHeZF1
	02lE3H31IGnuO0xr5BJr0S9rxUXZhzGXUJFDv5FxNmLa4Jc+8ylBTz9bI7URFqL8
	lw5XPA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp2asjaa0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 15:47:26 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e6bb29581so73582847b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785167246; x=1785772046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZgdZmBn3IQEwWFZORtGOAEY2N/1tVUq1A4uzZFbQxg=;
        b=i04mAkT6PWJK7vllrFoWzje1GkOx+b6Hh5i7YVXbHCWgbNkK2XdmG6fZ4l2R9K9Azl
         hU6vAN7SZQg7WSD/QXbuAxBAgwM93kK0LEGIrEF0C0JUByiPxC4+5/3L4JVUKrQ7uAAE
         PZCfsLUFEcXT/G7Wx6uy+BB4viH4tmmzZhUc48htmovIpxhQqF7DEdQpNVtBzW8PZHzL
         GksYTUHOkIF5fFeXuUYSV9i0uedjKjaYYsbWAFeh7Id5LH2CqwVxfg9LZFFq5OH8HQoE
         8HJhOwoyNrA7VwLKUG4DP0Gee9DP2Dr68G6+hjvAIjxQ1qf618lzUqgEZYLri2nMOh0c
         dmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167246; x=1785772046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZgdZmBn3IQEwWFZORtGOAEY2N/1tVUq1A4uzZFbQxg=;
        b=ba35sg0fhfpcCTRB40psKGg1xHzrJQXHkuwsX1bAWqZMCh2KmiZ6CZAq7dYvULYgNx
         ZS+bzICqFZp/9oYF2shxOO0V/5wYGgpvFGM+YtAsox8sEDFVkgMAjt49xG5UMAPgKqXv
         gqb5qpkitOh1xOlHmq//0LFLjBMORu4AnttyQ94SrnSDpLoMVGL1HgTeHjRZmgkqwBLN
         e6ud944zSnlGcojh41Lnlv0Uz2ZFUYcQ7eEkHUtVaFcZ1GjC9v1QNfiPZ+CHNWifqxu9
         k0fwmJNPvI1vSbzmfZEkC+Hp0jF0f01Bi17/MGSfRo4KbycMRyv0Iz/HiClN8DbKEjGh
         LDSQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYdSZGUpzDu/Z809cQijGiONZWEpNRl4qJudUJb9tYkowcCuxkoyLPrx4sVFqMNqm7cgJgdCY15qOxd8xQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPoMBqm28NAk7zOZoYKGPUj6y79aMgZV/z6RHrbpKyALoF5Weg
	riUoggK/71Jqn0w2kiK3mLy74E9MyV0srstfOhxFUJ4D18s1XPylg8t5CCLsjEOkjjTR5ktQSrs
	H8kGXGFv+eQqaUSF/YBdTB8hqr3PoKP7AkRn1z8HQcdSASF1te87u9GWwYEowTmIs3I8I
X-Gm-Gg: AR+sD10Gk7xHRJ5cEPjLBCV8GFh+aPTBMqycM5nsy0gCH2wKIY3rNdJgwUNQyms7EHt
	Otm9nwNVn/wu5ptAxd3+DTeOwrzxTSVxuiU3L9g1Ug1ojdeJkHUPl/wwlozp0OD78ti2J6Kohfn
	XupLWTXOE8/7IApf73K+qm38oc2sxMiqXnrnbN536HAFhXhal3Wui1aMG21s9JSGXH4fC2Vl+4Q
	GMrojU/JBtfX/KEs+Zt0JBcRw03os5lRoF0HgwTIS9hwazDomZI5R/u3rSa3k0mSmHNRR5PQp/p
	OlOBGUUfOi4fb4rabP6GDp2o39T/jTHKVh0Z4pGOukQr/c5rwXs0mHbPVFdSZM2HTNybGbtmutU
	uRNpFmbd5xm3xJIy786Yh63k+oRtI0g==
X-Received: by 2002:a05:690c:4a0e:b0:81e:ba92:b255 with SMTP id 00721157ae682-81f93bda78emr55327b3.68.1785167245913;
        Mon, 27 Jul 2026 08:47:25 -0700 (PDT)
X-Received: by 2002:a05:690c:4a0e:b0:81e:ba92:b255 with SMTP id 00721157ae682-81f93bda78emr55157b3.68.1785167245485;
        Mon, 27 Jul 2026 08:47:25 -0700 (PDT)
Received: from hu-samana-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f657c727asm33307617b3.19.2026.07.27.08.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:47:25 -0700 (PDT)
From: Rahul Samana <rahul.samana@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 21:15:03 +0530
Subject: [PATCH v2 3/6] power: sequencing: pwrseq-pcie-m2: add QCC2072
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-rb3-industrial-bt-uart-v2-3-2d100f30e202@oss.qualcomm.com>
References: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
In-Reply-To: <20260727-rb3-industrial-bt-uart-v2-0-2d100f30e202@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rahul Samana <rahul.samana@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_mohamull@quicinc.com,
        quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX4O+sVxHIWLo1
 ZlAwmXnKNPU8kdETcdDyOzYLsBLLgU6rx5mJ0QaedfnNkLeCJfcUFcBDHQF4WHrG9GEaFXtdNr1
 2YgYcYXgImmR1XEx2ymGvigTWYrdnh/nX7okLP80bMWSJzshVFcBXJ2CC04FlxhbcDLg8zLH+m7
 HM9rtj2A5UMC0jijqXsIDA83c5s4/fPVPmkNCA2Rp35aRth37yw41fJgxSY7DIw1YqrYMCPWxds
 Ea7UoGXK19v+lUJqaNFoSLB4Lq8AWP8mfg4KQeorl5luiz/WgnHtkzMtC1jZRIVklN1uyoKcysA
 U3Ghp/jWX3LVu372k2Hm+9tgDvm6bsuNKfrb+qVPdD+QbAmkbCTkBjP7rM2X/juAd6R6oSh3A6S
 +n16mxgqp4YhNwTF5x/Fsp1BowtZ9Rle2M9nTt1yQKciBa9kkTbjGgrTpsoyXhT/d20Nl/TAUQX
 b/FU4o+fZDC8jAFmWtQ==
X-Authority-Analysis: v=2.4 cv=UPbt2ify c=1 sm=1 tr=0 ts=6a677d8e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HgvfkwVdxQqrXlU4ukA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0OCBTYWx0ZWRfX1R0iF9aMYpjb
 S/Tjrn71u/4M/HdB+d6vTmVRat5CdYjmdCx0OIM/6VvEzsUIH3wEOXYSAL34Y8GbNgIzFvHrj4j
 r8cutcYORO+zL452+s/FHviq6Ya7BK8=
X-Proofpoint-ORIG-GUID: b0air7orRA1thBXHHRe9NNOZLzDTjM7O
X-Proofpoint-GUID: b0air7orRA1thBXHHRe9NNOZLzDTjM7O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270148

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

QCC2072 cards expose Bluetooth over the M.2 E-key UART pins. After the
QCC2072 PCI function is enumerated, the M.2 power sequencing provider can
create a Bluetooth serdev child using the documented qcom,qcc2072-bt
compatible.

Add the QCC2072 WLAN PCI device ID to the M.2 power sequencing match table.

This carries the QCC2072 M.2 pwrseq PCI ID previously posted by Krishna
Chaitanya Chundru as part of the Eliza EVK PCIe/M.2 series.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260703-eliza_evk-v1-3-7624440bd76d@oss.qualcomm.com
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index ddfe6ca82494..b9fb10901b14 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -189,6 +189,8 @@ static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	  .driver_data = (kernel_ulong_t)"qcom,wcn6855-bt" },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1112),
+	  .driver_data = (kernel_ulong_t)"qcom,qcc2072-bt" },
 	{ } /* Sentinel */
 };
 

-- 
2.34.1


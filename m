Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040B54334CB
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785578429; cv=none; b=XwNezYT+kAQxkV+J30Ebsv0ME5dhvIxOu/abCuC7rNKuH3Ec7rFQmldrHpWQb7BVsath6hj6ihyJMi1UkshaxxD6QGmMIvydC2VoYn5csvjg9RHUmru41uap/fGfr+rrhjsu66vEpBn+Hz1lD25+/Ex9t0NuCNJb/+AVlTS9hSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785578429; c=relaxed/simple;
	bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHm//nXhl8nsjZd5VeBOiL8EHsxmeEiWCOb29jUJ9BEGj60V6FijMlUOvlEVWbl6dbqikcsWbk/KMhN6K5ObuihpK5DjBYyJEEEIaXuVfivh1SLy/eU3Hb0k72NtY7eM4iRh2oGxY3Zua3gl0rJKawyGCEEtLe6cN67JS17i8kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXx3zc+r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NuZoVsXc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXx3zc+r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NuZoVsXc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6714BjtW1780543
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 10:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=; b=cXx3zc+rrdFwe+av
	UP1La1A2vDiRVnv4+zBe+7SPQ8+FH4ESaG/y0woQ5P2sf4f1QtyKxqy5MeWYM1xR
	qvDSVXHq1UU6BjUWpoO+T57S0wuI8NQpqU9Xhkbb4d0HEncrofmxJidkH+50Zwbh
	PM5mPWZKW21vZVid2ujGDjiye0LOvsl3dXqG9MspTl4xCLUx7Qdjxi3ckgjfJB3c
	v45frzRvv+vACHMPnL1iGqRmUExfixSCVtzqPqJxh9lOBmWGV7nADJWacGbTSBWV
	fx7PA3O1ZSwwj1+UrATsMJ8UgjZfzc+45vATrikXLO+dBCS3CLvu/FkB3Bk+fV/l
	PIrQtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jfrhpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 10:00:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1198217a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 03:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785578425; x=1786183225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=NuZoVsXcK4uEvOqv8ws16SZYT3Ckc7wCaGJiNzVcpeFDGPnrBH0HuzQU+aXJ/kbuxh
         5og15EIyLFNhlYv93oFvlUWeW8RxnKAhjkhYLHlYrMCHyZfUJGrxIv7vYfJEvIliuAAQ
         acX/sizOhnenWx0koQLcAFDx+DTf1KL76HcJl2aLtucCPZ53Q4+RHuIsSrSf92DT+Kdm
         S9GdAs7Vpp6V/TESb4YGVA2w187QGE+31UtN7zzP7RUsrIJpcm1DapS+Ej5WbqFTDf+f
         mpp+PZXm5nRDIVd1wzTKZBbuLc6BcrHKB3jJadi8cB6k9rw4nIVNhStQqWsn2G/nWH1x
         egig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785578425; x=1786183225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf2pAx6sV2vt+5z+Vbi+GKfH69mjyonF0TZZ0rYCIc8=;
        b=Fgh9m8aV4DHFIts1RKoRgatn13Qv4jz3VYrWrgUGEQaQAXXM7CY8NSCUVdWNPcMpd2
         irpH3hgFzP1D1DTL4CX20xIhpfvNmD7jK+/rVj1H87SFxx1EKzx76+3Pb/cldEjKKq7K
         vrdYQQD4kT2DmCh06d8SghMF9FpS8CrjUEbAzCDpdAxvQtmpWY292XNHg+ww4dXoo925
         w1E5WRQLNl+drxL7/HT5wC2MLkYHEzhXDVp3D9BVJialiIy+hi7ZCiDf5a7R4XNjm7+2
         gRoTSlDDdg1IzNDBB62NulJcA6RpHKq2fe4bLMgF9ludhTUuGddx1UiDA4BB2GGNXrc9
         xLGw==
X-Forwarded-Encrypted: i=1; AHgh+Rr7HRJsvUi6nJCpz5o3YdBUU+Vg8TwRb4/CenSoBGZMyqowcQUrPqJPXGJrHsPOYbRkvGJkEG8ydChDLf03@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLlUNCX/cXaDgEAgI8xbD7EPkrSXn9rWF+0G77gQFsC3VAZo7
	B/Sy/Dj2quEfaTQts+4YQGCjUXvXP6I2o8RA6LiyDhPFNAq+6m10EX5Bk2z9iKPnJyYmpJFTgXx
	t+0tkOLcVja78Yx+hUGARldmhC/NaYOG3oaOkWLNCa4ZECQ4P7l3OIWMV6RaZxrJONhLh
X-Gm-Gg: AR+sD112unQDYk9bFRhq13pJuOMR/Q+4ON+T2oO76E6IiD3SFDKXPTfOEjbimHekBGn
	BsRT9M5m8tuWXn1gGTuuojqGwNPwVAZueE7HE7ksRDRDU26gjKMFPB6EP5CpClHITv6lXz4lR+B
	1cyZ9TJB5ZRqcziogEWBR62a73JSO3OWXeFjsWRqy6PRrj1Cqvr6jjtn8VvynC0ys2uY6XUKbjT
	1/Uv1I3opPK9LKrAcK18E7290EAtGMnYLNEML+OBaCQb2W17Lb0x2yYwJ67/c4GTJGhQZLIXM2T
	QX3B2xbFtycT4EQSUiiF472K4sFcmsPEutzBAtdsxazjU7nNtCqgBlseCX4+kVAnqCH2i5QJtJU
	4xi+uRnrDugV63SJoS5nKnUI6/8T+jkfcOCp6l4Q1WlNVO8O9vzEdXoB0WeIDiHnH
X-Received: by 2002:a05:6a20:6f02:b0:3c4:68aa:8881 with SMTP id adf61e73a8af0-3c92a8f49d9mr2934093637.60.1785578424288;
        Sat, 01 Aug 2026 03:00:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:6f02:b0:3c4:68aa:8881 with SMTP id adf61e73a8af0-3c92a8f49d9mr2934042637.60.1785578423793;
        Sat, 01 Aug 2026 03:00:23 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04506csm16290600eec.17.2026.08.01.03.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:00:23 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 03:00:19 -0700
Subject: [PATCH v5 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-b4-kalambo-crd-v5-4-22160abacf3d@oss.qualcomm.com>
References: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
In-Reply-To: <20260801-b4-kalambo-crd-v5-0-22160abacf3d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785578419; l=984;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=jkWeTjrNI+xze3hIGsedzEI8x6ITSkIXkZnnxBafFoc=;
 b=Zw2IYwT8czOEWhwP5Nn6g7ATaeYoxIVBv5COmtWa1hRqgb+bvGdvcx4IJkPT4rmq7WADLkrVx
 fYzqsi1wcMHADo5OWjib4yVK7s5cNRNqgNsHKJw1AG1bz8S4m3SF3UP
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: 0gbgfi8xeCJemBCy-8dK6BCURm2eK5-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfX2fJzBlFvzq0b
 aSZ19pTvaQeXt3ZHhRQ2Ebx2OUkpueb8lG0g3szsc5JKerX4gQzyjWC8yrAo353+CfISy0w10G7
 cYxFTogc3jY9elbcflF9ObD5V+qSVP5KBvUX6RWELf1oKG+fsgH+G0nPGcpbwk9FUBivo5DOYRF
 1kiy194x7uUe4WuWImY+ZiqZjcFKbgLnabCeubUsOpFPiG09AH/BQdQBXn0xCSsCkQzK07Gsub/
 rcvXoP+LPbO01JrCyuOTfOMZRdXu21Oqnv71g2R8pVCtRxmwlhO3fe8Ov0x4ZPQFZUdAN//3kO3
 i55FrTCE5Kviu62oHbxURCI2B2H7w2MrnsPAgdT6oKIZsZeoKpgirTqaRvYWo0n2LDR4BueKmO5
 jFethruUwi4NWxiEv71QAa42q3I0+L/clgJtFUF4feWMDCwIGd37GS2ea/6Dc9nA5mIetEpSADu
 zOHHervsderOUi51HJg==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6dc3b9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sPeBD9Pss2NjrgU8DtoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 0gbgfi8xeCJemBCy-8dK6BCURm2eK5-g
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA3NSBTYWx0ZWRfXxmxY9i3zzqSL
 WRVc6FdGGxne8U4iWExFsLo5P8LeZ4RfD+1uL5TwAD1qlRT0ndfnvODgjGY1Ni6H0B6ue8zAyHP
 vV9atzjJ304QwAHTShv25DHObedBoa4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010075

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1


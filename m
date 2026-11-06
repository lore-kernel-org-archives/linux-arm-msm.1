Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953551;
	b=h6kYP9Dhxif2MY9yN058nFiVn8uiC8eIb9DDXnG5zyudSo6MbuWnftUGz9FATaH39j8D
	 AgsKLemPxloOLDsRVoPsRzi8qpKqgQi5U7G2T8E1kYv9m6Kwi6OQ+Ahp27uWjzfMZ64L/
	 L9jbFmHDthHyLpXjs6K2S91J05Bm/1nwejs44ma5k4VUjARyNsdvcm6pVl4u/F0w/3BQa
	 w2icpmugkKFUfQJfYdf2+LZkhVfTLlHbDprNPzPckpkr3+na/tDMn+19JdGehmBd5xsZn
	 b18U4zAA3gbEFc++irgU9xiX8PxHpgTNyAxQepRNf0Gi2MdJOx77qIMiNmxOu9BNWOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953551;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
	b=cbm49UNIFf4dd6YxOL1RQPGFZC1iEg8CeTXFbQRwpoIF+LhrgpUWr6gyN7Iwgp7qr9/n
	 BHD7NG/4Gq8dpbzZoP/EbsFnAu2a2umR3dhVp9LVnGiyYKJDpqAvGqZncgqMTLe85eVQz
	 ur9ldZ/T/MkwD03ozq8yPU4+VY2As4I1+uxfCRkOjnT1vdGw2jOn/VI0xzgpv0afJOOev
	 bbGtjUkP53EToXKgaQMtLHBIU84M+xDARP5x16CjPt8x+x7aFlWTKhdj+gDT5h39AroM3
	 Fc35JGeXCxNzHspknWJvevuyPEwvaqB29zaxT7W0LMBRvSWH6z9Bj6FWos8aQPJgFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C219606D829
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C219606D829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mV4cBhnI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=is41yZcK
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RNLP2933635
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JJCjzDhflBD
	eCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=; b=mV4cBhnI5f1bkIth55MkDV9fkvW
	GVKNJdR1cjKgXNLqy2Cto+za8lLqIqqeLBU83/iryod2JKUPtgmZhzPmjTWWZBwE
	G6nQADiLwDNtbFsSmMgD5tabzguqrcPkuyQBRIr5unVEgKLdOFb56/SlqwOU/p+A
	QA1LyLB/LhXUnpQU8PXaZ8KylyaZn+Ije0s4LaKLjl+aG0b3ORyAHHpoMnn9HO0N
	DoOch5cre74eBI0Vlzmn3vAqVCk4D/mCmsNmNUzXpeSF5UkQo0ozS19nnDppYduD
	oP8/o7EgnS2A6cl092FWDt3HC7JKsKIbbU31p/GdgIXpovLhqfue9nFT2Zg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1uvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:25:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so92035785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953544; x=1794558344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=is41yZcKlcVnkykHhVxctzLohW2pQrIZFY3onETvF5oT4mLbq7G1bqjqAwdL6mwTrE
         VohlwRoFYgxs16WLokF6tcgAmw2Mro3YqmK4TbSXUbjKWDxBSJE8lJ4T6T8CEvCmtw/l
         AcWj/KTlCp5uYuyHTRRpW4k9qYKXJVGLl/Uk5aGYHCtPJ2vM7DW7GJ16BIyoNYAX4TvR
         pHi791+Tz2DpBljxrbM8VZdwItsOAv0C6f5j1c2VMrEewPnAqn1Rxt25ycV9ew3+75ym
         BVNQYW1g8WSL4DNGzcAM4wm4UJUxTMpakhoaSH8tAsgZ8NeC5bjG7q1r7sImKCmNcvWG
         txlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953544; x=1794558344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJCjzDhflBDeCIYW5ftQ/o7ka6RVpdfZz4d2y/Qd5Tk=;
        b=XbBATywHSNBkKu0zbde8bxRPtzgLLV8bNYHFwGFpVp5KDESpxGvlyciSqHSZJoOkka
         bkP/KY5H90qfOEMYNIOmIBwlorMHypXbBh6nolnHuTa0+Rn9uzFTk6INhdfKsEzRglM8
         fn376ugb6iKecanHXJz5jTJa+Vso9hXTspYW6zcLcQifnf/iXvycXL9PbtmdI9CaSwiN
         Au1gVWN3xMVFh50ZqkQLXlyTGmI/iwXnUWhN0iDtDS8Z23U1uIgJwvtGpEhfJ4kpjphf
         PgefSLYwtqPGSi8T5yBOmSNMJGk2ojvn4B+tSdx2Ci4WHGEuWIKTtdpm9mEflruS0cFr
         fM8g==
X-Forwarded-Encrypted: i=1; AKwUvBx2o5xuONFPBE60mYuF9IicXUWr+I/NYt6TvCxREV2Z/fatw6e1tr7iWNymgpNHSgu9SMHW6aiBZKx/w6tC@vger.kernel.org
X-Gm-Message-State: APuU4Z9xhvHdfs2BDtDgwRKeEWkCZyKuf5PM45p5VawDAYKVvrrDchX1
	kDw7/ap6j7mMVQ3fA5nEHSgFODk1uY7QRSaAfOAByHMVSsklMEVKjX7mX/5p9LLpsf4BmdKc7OT
	JxelahApU08fkrZ0QFk6+n6CM+q/dgUsMhCO/jSYZM7srCY3c9WAXI/kHczTEOl2Wkp7k
X-Gm-Gg: AYBFou1oUC01QiHCeOkaL6LpfXCZlrviISUVFLlWZOKpNphVe8hUkUhp/GrTC3mNVhc
	pZajle3qJv8g+qwxHDFc40rz3xGRlePd+DAkz4zGo1KRuToi0ekQbIDnG2xiXH9gMD5ufqHL721
	EcbPt83EUDASOFh76oxum9m5Q82FEPOkHQIwsny6J+fwlDvUbZyfGMX82TXFnAm8B9lWrO0kfNN
	2o8pYjIluXSxzZIvoL/niEzaM017Y3TKYPe4vJKN2tQrkzjsNnntsPlKs+Z0dOXf56Yql9Pr4c9
	Amm7CVQbOP/aWh2mx5GeuL77hvfycPN/qghiVxJa0m6au6EI5Dlh6Lw8hc+jlntjVR1wRBv/UVw
	jw0O6WDk024WRTXEI6iwIhS+9hpU1WThMzZ0yik4iZG0/6Pg3vvFERM4eZwNDochIitSaSU1iEg
	==
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248646685a.2.1793953544437;
        Fri, 06 Nov 2026 00:25:44 -0800 (PST)
X-Received: by 2002:a05:620a:6c87:b0:945:f0ca:436a with SMTP id af79cd13be357-945f32ebe60mr248643685a.2.1793953543833;
        Fri, 06 Nov 2026 00:25:43 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ba6bc36sm130723255e9.0.2026.11.06.00.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:25:42 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: [PATCH v7 8/8] arm64: dts: qcom: qcs6490-rb3gen2: Enable JPEG encoder
Date: Fri,  6 Nov 2026 10:25:22 +0200
Message-Id: <20261106082522.1448390-9-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
References: <20261106082522.1448390-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: nbFYHga68Ntr3ew8bN6Me82MN9G_TTJ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXx6icAqqjw0/F
 qdRXxiqX18lJM5YjCcn8ceX9G4HXuqGI/ZwAbbXRW8+XkFLbTC/qAoGE748FrFOKTmuS6bxclTv
 Iz6/Gcj37PXR9AlTPuRjSnIMitEH/Nb70BHcAAR4ayA/AEP+oVA8o5e7MLWPgAXzlOGrb5Buvm4
 Iu4FNElXq1QVH7PP8vTTBGyfsvEaSOvs1vRvMvnuLYpeISHlZX3ViuFM0RJE3Rp9ccbnL1XFkH8
 R99LqF4Y4ERUpUzImxy93ywiyY2PONHyiTY6XPfPaZkE8qWMKzcy2GDGSDMgxhKUbgXizjWXybY
 sR41SK1chLGBFZAJWKvcGt8TTQAwDH4hPHhmROFfRtXeQqUiU9EVClUGPhAqTO7Y1yl39EFyCZF
 8YGPp8ovKStLvT6q6E6IUM+29wUXo+LcMViy7i3ekrfDzXkG8+Z08SLGzZiLK17QGbrobkF9aZa
 FvdaZdpTDxYGINIEd/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXxY33Ay8PYY1C
 gBYrYNoTC8wyikLzmuXmCYmtShccFhS6oy54Ak5YhvXMVidr/MHlEyEiCmE2i76HOrEkI0VU4qb
 Ahq/pN+4RjIKZq94zpL8ENL1mmz7iWw=
X-Proofpoint-ORIG-GUID: nbFYHga68Ntr3ew8bN6Me82MN9G_TTJ-
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed8f09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ciSP3Gwtf2YLaD0V-lgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060033

Enable the JPEG encoder on the RB3 Gen2 board.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a216..b96214758ce13 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -789,6 +789,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&jpeg_enc {
+	status = "okay";
+};
+
 &lpass_va_macro {
 	status = "okay";
 };
-- 
2.34.1


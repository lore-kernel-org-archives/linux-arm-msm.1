Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298851;
	b=H6/ejsTMSDh7+EYSiH4nK0ZKqA/Rj3M15X42s3Ot0yYbCL7ZX0JrF4QfshRjq7BmPjg2
	 9lysfo6Bqs7NKtzws1o1x7l+bVwW+HtjdbFYJ/AHeT02OXt2HM42stjzjMvBWcp2iXJ1K
	 oD1Lr0IIZEka+29Yn/zovCkdMWCF3oFSk0BZY0STxbv6AhAJ8YHo7w/15lH2YDHpOMKzw
	 wn485o1xqvbrmtWUAEf/7aHE7Q7J8dlguQYTBdrIDKBedYndc1/Q/lWQERICin7nDg2J7
	 kDrX1WpCVXpmvpvY6BgKEH3g3/C8aB2Ui1gGo9i9wXprJQkE6o8dwNMMm+xy164ZEcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
	b=VGqyqcHUY5aEz3yIwVsxK5/DxVLpTf/wzy/akqYN2B0GH53x9JxOHsQwYFrp2c37y1wU
	 tovReIagcpcIATt2+334IA42oca9jmqxt54wv/Pa9LmuLCYWoc91E0jMK3dqyLQhySkcv
	 bjYc30Om7HTiVSuMSq5PTBnBCvH9B6jb9e2TiWn0vrybbVQefKkhLug7agDgyD7klJTmR
	 vPucuTu/Esdx5RBAOpkq1RywGbkyWLDUg9EjmReMVqNO95HCTSKfd86vLLuWc4hvBwU4b
	 25bEU9kH7JaPuyMSSZRqyyUB0c04Bm6lRPPZ/u1ewEHBfKGabpiCyQlic1sHuCRRN8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nqg8Z6Ih;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8u1spLp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB6606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02FB6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nqg8Z6Ih;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G8u1spLp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDXJY3234253
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=; b=Nqg8Z6Ihagzw7ANe
	h1hJK8haxcQLYIloiO75FemzIjJ6LlpqCBPmRYA44X/VI4LQJyiXTe8vk8zc0vek
	gUuntMQlapsbgUmjP9WWYIbh8wBSzSlmkMJ1e79GgGvk43XvKGImicb56EPxvZO5
	IfMYRQIlFOU8CsK3P3RVnN1aSwR3U5kPTdcRKP1J7j73sfUJ0OFEEdqKBZG9XQO2
	2ADDufJn+drr/YLahPjKcNdzuiKOWdrN49j/K4nxvIQOnDhb4nMIdSwjCgwqyOZt
	zK0uS6qNHErGJ8/ne6LGZLxYIp/M7wPdipglPqw+4r1uZ/WoS6YirVxxh7FW19wI
	ItFgHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b2hkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so9411686eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298850; x=1793903650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
        b=G8u1spLp5ysm4VoY+iYx+E0X0NB6VmTHxopt3fwiURXF84Olbp1lJObbLfItB5LuPB
         FGHgKfvKrusgwBAlSl6FC6TDWwP8hGXzTCYGOKhJvbSS2mTOQF/4eAs2jgigMFjDENiM
         Hk13QKbpbLd/IZI2bygFHC4hmnHkYtKKTuUfVMZHYQCwHz92wAJn1Tp37cjc6yIzX8DH
         tn4FLQO4mh0TrQHOPFYhzRlPF6sTsptWLNuQICwMliOIlxBA5Qwcyo7u01ahGF3fhhAp
         JKjHtRcRhz8uMYNnW4V383AkAe/L5lzObUP7kTlydaB1NzxacMC08UdC/ONbHDO5J9Fb
         aYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298850; x=1793903650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnxDT67HWa+60SLBjfh2ADVB0tvFWAVx0poSY9Ujd7s=;
        b=lpd7CWg3TyXVeoLKuSx44wxkbZhqphA8aBGR2fymfmU/GAePH8vgLYgUM4pgrDAo7V
         WkP31/M2EeTddXp71Fdsv0yGrt/MWSpn54pJqBj+pkBYf2Nx58PIqrudP+Xn3Ouc4ulW
         rLdCc9lcoTVMiExFxvATm7d8AN6H5WEIjns2pzT2W51tlKholuZx4cwNm+csuk5ECBKv
         6YDhIxNP+OEdRyv9tLXPANAhFeiZwtHFysivbTWDumV+/DZ5kt82WTkxFoKAashUlV96
         zqDKI/Cg1TPPos9t7hgL6gpI8HgSt3ZdfqFYmhHtFrTL08JVCHQbwqfsGmASpqLhlsVN
         mYWA==
X-Gm-Message-State: AFq9FYIQAMtGv+gaNAHfWssXuvjI7RKIWy+Z8XW2T1J7i0FmX6rOPco2
	a72lR0xRzRK3NuuO+rwHKjH6yBmM9cC8GIxb0yjjU1UqFQM5dSUeZV+OnPPvxUHxoZwQnYjJr2g
	5i74OK1wRQAufWODCP8qQVl1nxvITmLMOrNqCsKX+R0BBqHpIwpy+TQdg8ipHfXpty4f1
X-Gm-Gg: AYBFou2RlQDS/D9dobtnMSP03IK9IiOnTxfTXw6d/V9xQIOBpJV5SeW5yZoNCAm1ssh
	88FRKzhyueG46z3qfJXtd+uTZKNO2uV7rqUwdLASpXl9DfkgLQc8cp6fGOCBHCgwTnrYuSY08eK
	RhQrgLW4n2cr62ZgPdceBmfbD6YmjW6cngaMyEFEDuwAMEAf1TNHLHh/dFc5MwkuYB7UL0kgaCE
	MkO3Euup/HhbJeI+sgSuB8KvJYBRWKb4Tx7hG/MQApelo+NfCTLD5/QeR5T/H9yFI8dnKnnKuzd
	UPlgoFTyFegpPtU+Eei4ohI4mf8JVVvfqw390/LAD+C4BQPw4/I5c9kl+3OyBLSaBbKRct49jgB
	n+3hYCKICwNDtbnh/u6n6cDERrSkWiDLrVG9hGQJeNhzYeg6lkOmz/GfQ0Ytv2OAuPWrPWYIvII
	0bpVa5anzKif1vegIehiPs5L6llp70nJUwKQ8Cj9eIVQ==
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr355947eec.39.1793298849566;
        Thu, 29 Oct 2026 11:34:09 -0700 (PDT)
X-Received: by 2002:a05:7300:4353:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-36a42434630mr355901eec.39.1793298848927;
        Thu, 29 Oct 2026 11:34:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:08 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:41 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: qdu1000: Mark USB controller as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-4-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=676;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=Ot/jhWbkfz9JIUnzdEZeTq9RWVEtwTHZa8yLAe2UUkI=;
 b=3XQ5wSuwVnrZ/rUs9X+O57AKxO889Ku/apnruYrrtbOeYgswuDo2FRjUcX5yGE5RNe5Z4unL7
 VpqUNfwuiwTBTPG79DDjoEQvGjTQqQBLacWLZA6MVyz9QFynOhv28rF
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX0semp8+T9bU8
 2kIwDBjUxVjX2qtoneL/WKLa46LIQsPSkmcCns+viaUvm4PqZAGZfBhzTbrydRKLsnxeX4mNaS8
 grrHRvkUnUo37lDfN+1ftoBpGt99YTU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX6cv36Eu25s6i
 I5ReLFmVyQ3ohqb3enmGNCTswkQ1RKY8S//NAxrl9jD54KHHyYsQxsgVDDT7CpjWsmIUNSMXI/T
 glk+/bEnXIu+tjpkrTJA99m9T/6s65a4vTdklu/XdLL+LWi/A3L2RMro2nrG6RLBn1/tTCrPY+K
 384nNPS+ojVaGY+y3AIcbXpwUpmxZNCMpbn0QE/zGp30bSqEELkd9ti/UVrdd+1WoTad0qZiJK3
 lZRwgP4wZThtRyAdlGxbUX73LUwnJiOep6rdQ5pWOsZf4g3OaFDZe9d0vV0nx/iArS4ez1g2d9t
 8lRhiLzvi9UGiddtKnKMHKhemnylw56GOJavj5aiMEz2cSWKQaSyewnGk7PTq7Mmj0wBQcnZ6sL
 PVT3k41X85/6z7jfIvdxVF+XBcthrxXcxWtskcEJEvn5A/4I5+sfNxOicAzX1xCN+cSi+R/1Jrl
 tAoMjFOK4GwYtgeLtWA==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae391a2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=YCH3veeWGSw_5qN_8KAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RTe9Q0JJ9rQMk4LO1FDP8bedxvH0R170
X-Proofpoint-ORIG-GUID: RTe9Q0JJ9rQMk4LO1FDP8bedxvH0R170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on QDU1000 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 3a25b5100836..30a18360ef2a 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1031,6 +1031,7 @@ usb_1_dwc3: usb@a600000 {
 				       <&usb_1_qmpphy>;
 				phy-names = "usb2-phy",
 					    "usb3-phy";
+				dma-coherent;
 
 				ports {
 					#address-cells = <1>;

-- 
2.34.1


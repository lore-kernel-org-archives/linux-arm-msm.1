Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF53546DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236284; cv=none; b=CKV0NIZRWl5FwFH92wlOTn0R2hKqKcipuFtu597G8tphAwx5Jy1jAbofQsnTUBHyLZHx+U2ldUnGCjty1D9RalXN3Slsjr/NAnOc6yyKQDJsy/qk9FLzXKTa9aiSAa15byz7PYTGvDrH2+qY2XZdWB9J4f9bEpf3PKuAhhW82dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236284; c=relaxed/simple;
	bh=BhkOYK28pMRgnAFg3axElJ/0jV+SlRNGNmaeKhCabOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzWX7UBHyi0wNc0LcCxXPf15sU+aW1IvcCVe3XLVxX7Ml56d6uu0D34xXNGVIqdj5+L5HGY9juU6z5qk3ApyKnTQSb54ZRRew8AdeVQWO9ZNRnOk52j3gLY4SLIDwcdWnLDfzb8Ded1aXxXwHdjckChSWuBYLqMNndAquCH/dxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+HO7BtV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J46gNBau; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+HO7BtV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J46gNBau"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7WNN3559818
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w/t5DVoi7TH5Cdgh1wqQM1FGHTFp6QNHPSNcYTK660k=; b=k+HO7BtVyOTPCX5k
	vngtbsUGCspDYm1c3h3K++oGDzn3zab9VMva/c//EuPvz4e4G1/qDWH3Q1JdWpud
	1tqhJ+72fMQqfRCIAoeptvXHpJ7HxqnJjaxIjiRK8Y1qoooPWAJXdiSLmuMEXndh
	t1cNF1vBekOT3e9UQAB7pmz2Jsl+s6zN3ny7+2pFaG3vuqZM92+9nPuMae9Airx0
	oBiALQPwmNVMeM8PTwzHb7/JhuELcE0ZJoZGG3A0xsIGsA/I9qDrTeerhZs/pm1i
	EiVC7bDEiZFzLWIWlZIS7iDyskfKATj3HTSXfcb1fBbcZllpowVDiCuAQVu0LSB2
	aq6arA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk18bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:31:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so304726285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236280; x=1787841080; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/t5DVoi7TH5Cdgh1wqQM1FGHTFp6QNHPSNcYTK660k=;
        b=J46gNBauphgcSZnkmrBkuCBsnH+B6uLyTYIjKmmtDqbWGZa1SKsbzqvt9ZkOQ0tzWz
         9pwfIIVghNs3NEINuqAPGfUGEr/8nbBSvo0ZNdETRtLs4BhOUHOQ4+9bXGKhLAcy7leD
         MXkRfbOSu8SElbK/oppMhr2DquwxiYHhHL8CgTc4RrkbpnxlHeJP1kdQtYmmM3hrcvwk
         ppMtiLPDeZg0Fj+bOSp5Hg47Nqi+fNr9Z0tJNQkfR7rgTqdOMcpdroRuVWABS1IJHZY9
         Wrxho0IplLqwKS+HDIjJ992jLP7TQ2u3a4oj5GYYUch9PJIc4jLgiy0HXGq0SK7X+kj0
         4rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236280; x=1787841080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/t5DVoi7TH5Cdgh1wqQM1FGHTFp6QNHPSNcYTK660k=;
        b=QSqSW4O73KL0CL+NYfEtGxJVZv6QcdJv8O9K/MZp4uIMGCpCjITvhwFaUwR08OrY6q
         ZYTIQL+6BgZBuUPIcqYr/zBqeR3tlxm3Q5SLTxdeJJscU1UnnCa9pjrYwwB92W17XzRo
         8E0G5a0JZ9MCFWDPNzlBHPqQB0hNe9a3zvPWJkdatcQ2NwWC4S3s7aQjBpfSQCzIcO32
         HJBUp+y+M8r57GxsvuutR7AxKDmhdU0ywupJtwo/bkVqSo3loQdrddV77q744kLK8uMi
         ifv/hFrm3LieRiyyB+kchTS4LFfYKYj0RPMtVMupiy6Mp8IjZx1JURmEBBDjDeejKUhZ
         B3/w==
X-Gm-Message-State: AOJu0YyyX6WzSbdRkAnNurKNYezn1Tq7hHnyYXL4I8iLdDMn/3Ox4oDQ
	ikTuewxydLt0DG4O6aePOFVqEzBgSAIk9vzIMvM4y61qpsQSYUEWSB0/VdPxsz+R2qs9MUxyjed
	c4YPgGTbYW330oxmLwETPnVjpCUEKQIVjSHqIkJaHAC2vxNArMgwnq2IL3pf5Ni98K0N6
X-Gm-Gg: AR+sD13SpyXg3SgWqzdzm5V+IIdfycA+/EDSKYiSsmpZsS3m0PMd+r3QDtPoPI4JqUS
	ocgRDgSl+ymrdyNId+ACsaUiCokk23y2+p96oq4tnPs2RVdgV+gQxEoM3yIsEkltqbNSPdRxeHm
	5g5D9ECncqgOGvAw0Fz2i1eVfeBk7WO0jO021uNaIpPxhoOeNM4limwYE315ygmIs7NFu3hQ+Cs
	TUeJVXZlEDGW1hxZ3i8DVZUU49uwrnMqQWR+apz72Yw6LzzcaWnzjxGgg9Of4DlcPhfOZ7zgvy2
	7y0MGF7SLGXt59aXsna2Ee+ns8E0Q0HRADy434/zFmrXliTL2JI3mPqdwxk3ZK307w/dzB0SlmU
	tYyYWgm86baHXlYCwnF8zxTyaXIkFZLUiXMtz
X-Received: by 2002:a05:620a:4594:b0:936:f984:bbb4 with SMTP id af79cd13be357-9371e2cfc85mr1067603285a.3.1787236280304;
        Thu, 20 Aug 2026 07:31:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4594:b0:936:f984:bbb4 with SMTP id af79cd13be357-9371e2cfc85mr1067593185a.3.1787236279786;
        Thu, 20 Aug 2026 07:31:19 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145c9d7sm15226618f8f.15.2026.08.20.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:31:18 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 20:00:58 +0530
Subject: [PATCH v2 1/4] soc: qcom: geni-se: Fix endian conversion for
 serial_protocol comparison
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-fix-write-to-read-only-firmware-buffer-v2-1-7badcdc455fe@oss.qualcomm.com>
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
In-Reply-To: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787236268; l=1170;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=BhkOYK28pMRgnAFg3axElJ/0jV+SlRNGNmaeKhCabOk=;
 b=iJQJCCKhcAJMSKaI/4t0HLYDUFkDFGoH+1Fm9791WNrlxjwkVegDOzDLJDcZDypTHk9xeZRgD
 Ne7/j/jUjpwCwijydn0HDlBgTrxIKdzDDAFvzu0z33ZAcMbQ6w5EQJr
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-GUID: 6E9CnH5ZqWIgyDRXT53PTy39HapkA6BX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfX9/wwJGzaddaH
 os61xPMLdzfY5qNv1jajOCBPF5cvCgpmy9gORqtTUeMUZPJtWI+r+IM4uG8VnRIKawZ76AbxZqa
 NoNU6rLDtVn0QDJT7hmZtTNLUu27eHU=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a870fb8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BdrV15eiT15NMrSX6N4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOCBTYWx0ZWRfX5+P57QhDCsWB
 UKmUNAn9HqV19MKbotkwl3KS4YdsjNYvvY/HAM85wVeQapfaWYT3srdZIrdtmZSN6CnhgzXMt66
 L0Y8NxmUNVh5+ozsfosI8NbzurqS+8S/cLkn/FU1PN5qzxUe6Isdji3CFp+ucGiskDi+lZZEJ4e
 fO0kqPgQ4pFVqrjR7KhSLc4/0ollbBJYYEkMZ7xN4pHYUjAMfDpIuSOLqBYwpe06h1jjOIoOYk7
 hY4qxgJJNjxmyDlOhr0UNDhSH3++pbFxO9u/rxt0OUMVYRUtVU5bvz9HeYaXuMLPle5Lr8jitCm
 IIW1txQpANjFyTQmVLkhukVo+HaFQSoiCI5zhtQ1gK4SXUn/oPvke/SYWovds88qYBloChtAnKW
 AwTuvK/DNbmhNBF0bys/ylaHC5qsioQMeUT2MijLQa9FuCVpmg3PCpUylbd1si+a6YVGbfeb5VP
 bnBrhdC3Ry/XdiiWgbA==
X-Proofpoint-ORIG-GUID: 6E9CnH5ZqWIgyDRXT53PTy39HapkA6BX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200108

serial_protocol is declared as __le16 in struct se_fw_hdr, but was
decoded with le32_to_cpu(). On big-endian systems the extra byte swap
causes the field to always compare unequal to the protocol argument,
so no firmware segment is ever selected.

Use le16_to_cpu() to match the field width.

Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..1d6e6611441d 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1298,7 +1298,7 @@ static struct se_fw_hdr *geni_find_protocol_fw(struct geni_se *se, const struct
 		if (le32_to_cpu(sefw->magic) != SE_MAGIC_NUM || le32_to_cpu(sefw->version) != 1)
 			continue;
 
-		if (le32_to_cpu(sefw->serial_protocol) != protocol)
+		if (le16_to_cpu(sefw->serial_protocol) != protocol)
 			continue;
 
 		if (fw_size % 2 != 0) {

-- 
2.34.1


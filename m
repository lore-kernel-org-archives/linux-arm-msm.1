Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411626;
	b=wcCIlCrEHqZ7BKBAFHp2WhCXS+0yJb8B6QRFGckRxBg6aNHiP4+2jEsdm0dwGS7dIA4w
	 ek0WqSYkf/zGMgIWW5AqqBVK806HFVIlKGSDhZjns4ymadi8BpAv4j3lHv0wR5TKSCX5B
	 KJd8B/l/U/WIhlXeBe3h6OyhwaQbeqFAAlte31qoWfyXBIIVK28daHR7i4DNJDnDNpmo+
	 EJEflnVPQ0kvp1axckQk+yXfqwTz19CMEZ5yC0YVA3E6aFDB+KDrI4gM2bx3rH9cQjT9U
	 mTTwwBYzbNSkeJP2ePdbfvzZnmAkBrJKdcuSkkCwGVesiCGZPnFcJcPgEea/aqR5kgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
	b=tHj1rHxRXQA0rZwqE5G05RUhyaA6eR2KNxZX5ct9RuV8bsVBmJ87UHXBhZvbFrAQoiNi
	 cDpricINykNqV+uP/Z1jxilXpxJE4ug+dZeJHO+e8XAK6DZKemrnKPNLTpNu+4Z1Nrlx8
	 GWQFaEhU7TdNiez5aLMAr0CxMIZMZ+RGid1DKY8ZIohUDfNn4IhFn101Mec3KTiR+9eVG
	 3n2feKH72kosid7Ylo9/PUFKssBBjgmM6GgByFMJ+1zJbmWmBHN4QaAusWNEOVyDvQIqV
	 FUSxku/MLQycpzb7qYe0Xx75T8fRQswVGWnpUGCxxA2LUv2H/tQnYo9K8mRPSNuzhZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EX2QuMe+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53480606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53480606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EX2QuMe+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFPOCQ014772
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGCAfUgjVkl
	diKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=; b=cxaw0+0nJPb8xv1OcNihqrICR19
	cOUC/HQjzbHBOYXUQp8NZBtSs09TJ7g726jbczD421vHcwuFl5MM6BQca8bxpTX1
	RNz3JACOR/vBdO9XcTR2RSKWAuBMmHGWHFmi/zk1q44W6z/nWoTtIWdEoDFMFbKx
	yrr/e6iWlm+T5OZpstJVnmfbuF1cKujcnH8TVVXBG0OjfSNkP0/TXgmzmzLGmWuA
	G+0uoUWHYow3JIXCTJMMo8TYAO4Y5OxlDvJcfqPsaqpcxEZuFNd/UIgaUAT0L6+Z
	1dDfQKV9aEu+oVlGH4c83K1DkURBxKfBdXnnueftAyAKPuZPOzOjn9OdW8w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymr32v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc36b97a77so742960137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411625; x=1795016425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=EX2QuMe+yk/j7nylCzp8B98cHz/AmyOvRz0tgyeUv7ojLcoMof6EN3OM5S18Bvq49w
         pECByhxpWaDdchwgkKwvi3BysgQlNLMzg84T65FdNH/En8M/JF6+fdrTn8tauKoLrdPu
         gfrCUPXu+s99JoJid5Iyz+pI9n4Vu/W8/djvsZLTLsyYzp0sQreGiNm1uSP/XZ+0orED
         KydLomDd13UPv/u1sTSYYAnyEnBKRJidreo+XM3JgUHmDTF+xFvN1ALT2u7fgnhHemGG
         v4Ko3qGKXCJP700BEWQ1QwCqM9cZKBss5epojdpovp1tvWLcUmEgtd2rGbSk7tfuORmB
         F13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411625; x=1795016425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=0xsa/8yMDHCvKUi3yVqoev3b7sXlZQWWp30Mo+cIPPfe782uxJLiEnxar79KEC4Po2
         nNw7yZAmkZ6xG7LdjQWigkG+1Fs9Sb3XVUwLendjeYi8GaGTko5MK43u/Hst6Wkq1q7t
         VRnOtsGUQJheL7DcLcd8DjC8M+Q+M6HWrrMQgF23H9L41r9Q00JlyKuThb4e6tksMRkp
         ETYAMx5PKOtkL3SvL4Ga99iMG0DxpCyGTqwKNFpzDtWF0ulS25Ew6GxjzBnD5JHd96LE
         Tp2d/Tt/vh+IWDcBCXpVL4uRSEcopWZxedbbN/kJM2dZa1nB7L9q1A5X8GVr0lbklk4a
         053g==
X-Forwarded-Encrypted: i=1; AL+hErERtplqZew+93aw7DZANS304GIoUSSOE4TF1oAISslo6BSj7BKhm/juBd0oYH+r8OEsimhqho2uJmITSJZj@vger.kernel.org
X-Gm-Message-State: APuU4Z9TS7ERJfshYxGkIxqT0x/8956XhDp8VwV8u1m7d9HgRHpyDghr
	P3S/Za6RjVkg9yS0AaAVnD7sWV5DOLbgu9M8zr/9VrbQKzTUHkKetU+E1FD/PCwCtn7zgEwOb2E
	YvELo5HQE3BgRXfLHOKSbwcXTP9KL2RSQcY8yog/LzV1KOEtoU8Z6euwDK/oExbaslTRA
X-Gm-Gg: AYBFou3E4j1yrGmOaYKTaelS8wLezWGlsfzP7UODvWuLSi/HgOsOkPMrQrQBTg8cTgk
	1HbRFBP+J9bsQDutVvY+XHTv/pPXXHstgTxUNM92QHoET3owHcEHCz7muWhdg+slw3O/4kxMoKv
	RPKFuBwGtZI/e86pRT/jlqylspMowiqQWbtN3LYHmiqCMc7oIYcSJ4x/kl3U/4zswg5MOQIVdzV
	CjUNdt+VWw5Hu4q9rSDYYC2mji33Xusqn3HbNQJH75OFmyDjmwObxbGh+w6iIn5h3NEjXZKsYKc
	xBoLq4j1OYaWkzp6jZ1KErAGn0JN/XpvwjE5FKfph1HYz0Kbd07CCVzSlNwBUEDENIvxh/6SOu7
	/ZXCjRHpA3PNkYKKv1D6wje01bA/KvivZUNRPpJQiXO7TnltkskD1iLhvnAnsuSHUJbyxGfeC9w
	==
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923942137.4.1794411624567;
        Wed, 11 Nov 2026 07:40:24 -0800 (PST)
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923924137.4.1794411623943;
        Wed, 11 Nov 2026 07:40:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3528265e9.13.2026.11.11.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:22 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:21 +0200
Message-Id: <20261111154021.654708-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com> <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
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
X-Proofpoint-GUID: mg06M36hxij5FGLJs2AKJIVM6fwm_Ni0
X-Proofpoint-ORIG-GUID: mg06M36hxij5FGLJs2AKJIVM6fwm_Ni0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX2tqLUNpjBv2+
 yYjB/qscBAYVGNTB97ZfQM+3SII6sbXSXEEcrSb3Iko57LPp7uJmHVW3bRzU2KqrcRjTfEHhMuV
 TZAii8sImANc8z3l2V58uJFTfFWgAxnq6j6Ha+eJb7M4IvwYGyM7EFsL3HEQ/wofKZWtVKOXNSi
 jhq+RSEWp/UYVYyV1vumtyy72qgg/xlxL6T/eXucA4ijVD5EmKQ+iTE10m62T4g/HezYP4GppPG
 f542TUGYBN+OlKSfE2pXtHtlszswaILFb/ld99vAMzCHn3gCBJnSfr04zFfeNv7YKpNeBBcNvvk
 M1+aq82SidtY+xQ4zu5ORhOJnY0ySFSBhn39mqNoq6QunMF2gGwHP+kAZelEqjylpkdeLn4fDVo
 nToR3u6k59hDmgIbqHBrD8m7txZSL94VKdDzTQbQjOVMHgycCE/F4hkVUKxYQzirFvu4vysgEB2
 dqD1fLZFNCCWJoS4ULA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX0ej5vRVqgDsZ
 ENGAs9+mbt6KIoMoyL7BzN5PPQlfeXTMWuw3+nQubx70M0fWBkNTghB0QS1ITxRVKUW1MvSSeTH
 RfoIn52iTIZnLWyd9BTQ+vx2GNaxrso=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af48c69 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=dxASnj8t3s5ti5x4tK4A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:17:53PM +0200, Dmitry Baryshkov wrote:
> > +			status = "disabled";
>
> Same comment. Enable it by default.

Ok, the same as for SM8250.

> > +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +					<&rpmhpd SC7280_CX>;
> > +			power-domain-names = "titan_top", "cx";
>
> The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
> MX should be listed here (and used to cast required votes on the MX
> rail).

On SC7280 this is different from SM8250. The camcc node has no
power-domains property, and the sc7280-camcc binding does not allow
one. In camcc-sc7280.c, cam_cc_titan_top_gdsc has no parent. So
TITAN_TOP_GDSC is not a child of CX, and a vote on TITAN_TOP_GDSC does
not reach the CX rail.

I see two options:
1. Keep cx in the JPEG node.
2. Add CX as the power domain of camcc (binding and DT change), and
   then drop cx from the JPEG node.

Which one do you prefer?

About MX: Ok, I will add it.

--
Best regards,
Atanas

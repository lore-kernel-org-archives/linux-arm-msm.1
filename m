Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D0E3D4130
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281053; cv=none; b=nzYIT30NQeO3n3qrpw5Eo74/DRJBL47b8a61SBxWxPlisyokd0PFWrYnLJmO1GgB8bBQarBowNuDlIepFUfA7KCvq6fdhmframbSJea0fcL4U5wnkid99oWsL+GlQ6aFm0BSo8c+HGy2uXECZgEuroPAZjWNKzdb077+4SWHyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281053; c=relaxed/simple;
	bh=lB43BLrrF4qCJ1My9LCPGGcz20SYfn9m/EyhjZswiwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAnaZ1Q5egvzzTp6Ur9Q0IX9QZD+BQHFg8x8Lhn+ZaH4uMoGd5K0ks5j9P719YcUrUf3DZh1E4kylm+K3s/QP5BmzsxXTgY0rQy+4MYQH1+Ml75c1Opx0dFtrXd82s1ib7v80plukrN7ueCqoaBHtwfMltFCY+Y3GGgbsX69xU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/2AtikZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dPtXFDZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/2AtikZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dPtXFDZa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQiH979766
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqjH0xbr9jaa/R+IcfBgT1wDJqvkm9IrLa2Nkt7CgAk=; b=K/2AtikZMXwu9amU
	+VBu2n7CMNagcRcbx2naHTHPi3aL2WbNnMF1dNx8boAxsXQGDuPceJdkOeQmpkJ0
	zADjY64enWvLhXZoFbptdEPkIs6Lg2qIwxDi0Oyr2OKGZ7WWwL/Y5G/yFsz4ErN5
	Yw3ieU33390BMXly+ouE24olPhUmnDlk/Mz8PqnnVrSnd6qqSX5C0LUnpBHJJQqN
	kBWW7fakZfHOVUiayhScbDvVHWW3ZSur+jpSWPD0mgV2OBs4AaImjD/Dr2nUmi/T
	P4dhpwc0le3aLck8saM9/6KWIH+wO/AIgccki+39yT6efw6/BNCXDIyorkgPy492
	E7jxCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9grpe7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:37:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eb5f54b6dso155593285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784281049; x=1784885849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqjH0xbr9jaa/R+IcfBgT1wDJqvkm9IrLa2Nkt7CgAk=;
        b=dPtXFDZa5oemKMUzXRk8B/mGuGb6YzKUnZeMttEJoPzsh48hOQspr1yqxU23FIDJPl
         +WzMBZFJMFlHp1/XsbRb/59MEgfBtRmzVARcupj4nGtMDIf3KoiqilfN/bRq+19oSH5a
         pa9QVz6xY95iqJw0LpEoWFQR5uFISCqFRd0J9CvtfwGMrmnSpudXObJyJ/WjCmKjowF/
         m7Jghe2EMR6DVg7t4ovgSw4KijCZW9NqrwDcjknajhwv0hhuRszYrI25GZSiqqpn5Ero
         VF4QV1krth9tbIECkK3Us11oF1b273KqCX1XvTMnLEy3trEio5jyhIivsEemU+rw9hmA
         MqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281049; x=1784885849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqjH0xbr9jaa/R+IcfBgT1wDJqvkm9IrLa2Nkt7CgAk=;
        b=pGSekTKiZEP/rugeucEgryEy8tSTYbbzhV7vfv/VpkQUlmoMIr0ziPDhqVjo4t6y1J
         FQa1qqqqz4MvavmE1MlmQMuea2fwDiSWYGJmy68XBy7TxrMxOBHln4OqNo1GZnUgRTsj
         e69E4EUvUgCwFGA+XHX93+EfrHoAAxuFoNw47TBYBg/YtgGgyGHS9K0DkhFNvgbglGBK
         6IPW+7Gz4GfVy3X6XXmJ9edogA2xi/VJ81RCaz5RBEmP/1wuU8PQM4zgnTKIx5aYHseo
         4ffzJ6H1OT/0DPo7dA1JlETFEAQ29tdeK06zNTwtvD1e74yWg/GErsogevq+uIQtGpz7
         Nqig==
X-Gm-Message-State: AOJu0YzZwPybO0rRdxl9Nmph3cLyRm4LVyRvlyzLN5gURkUl2ePUUEyU
	J2/gHFikkrQB0drA4fsmhkkzfK+PtfeXSqSNahAgQ9aEkrJ80j9FjBVvloQelIRcNvT1+omz2pu
	5o7X3vN1ITRvXj0tdiZF1qVL2U3ds4ByXp5TwrzWaI3aMo98AODLaoebI0G/ZwPJgyIwa
X-Gm-Gg: AfdE7cnLOq0icHuPu/mkQpI/7q4ZY13Ze3QaXHFh1AN21Brh1rHG487D7j7b7p9sNNa
	z4xuYFt+P/tCTm+ChBsGRZ3rNiJGjKFlnmyTMmw3KgLNvPUmCUFF5dmHkk2tMS2oVTtk56SaEh5
	+aCJ8scezNTmrgHBwqrN9z1/bjCPxi9D6vUqWGjtMhonpkr4OFkky4o51ehxrvdB2hcTkzqUAnh
	XLs4Q36J8rgZsKAM4w3ed569BOygCNM9CmvJBte5q56g3b89VJ5o3dif5NxoOCHwLO1eEEIdXXf
	2REt5qHvPODKARXAcoVByHCCYYDiAITyX3UdLewQuP+/MJRTNQVu4lEHOS0HdChopvLCmDuCVtH
	yGoVi4qU3uFjxIXr1H5lRk8rm
X-Received: by 2002:a05:620a:2a07:b0:930:a28f:764b with SMTP id af79cd13be357-930b41d8b09mr169967885a.6.1784281049099;
        Fri, 17 Jul 2026 02:37:29 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:930:a28f:764b with SMTP id af79cd13be357-930b41d8b09mr169966085a.6.1784281048709;
        Fri, 17 Jul 2026 02:37:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f6f3sm48017066b.38.2026.07.17.02.37.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 02:37:27 -0700 (PDT)
Message-ID: <680d6e1d-288f-4c9d-bef0-e330735c547c@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:37:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v10 2/2] arm64: dts: qcom: kodiak: Add EL2 overlay
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260714071943.2036353-1-mukesh.ojha@oss.qualcomm.com>
 <20260714071943.2036353-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714071943.2036353-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5NSBTYWx0ZWRfX/+we2yzmThQ/
 uIfLd+yRgZJR1aT1bPSkGQrkNyZ3Nd0ZvPvGXRLQAhMPgJjYv5TE7l/7ClLaqjLg3dXO2d3D659
 MomzWdUv9Xc2Yv+KCN1uM/gb9JBfreA=
X-Proofpoint-ORIG-GUID: JV1Dx_YWoVs3mpGdWEFWmuip56OTkqfP
X-Proofpoint-GUID: JV1Dx_YWoVs3mpGdWEFWmuip56OTkqfP
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a59f7d9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RNpBc-B2Pr4ugAXc9NsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5NSBTYWx0ZWRfX/bn6cIC770b2
 qKVQiEDM2l6C5yEE6vJSJrdIiaHMpTj+2+n6juRNZTCbgwn+0kUyE4qAZZovESOnRgL/NqVdpxy
 YIP/kzA+mkvkCS1IqXsfBFXUeoxnnGPA8/GYof1I++MfrYI3ExSG56jF+dgCGcnDwv7et7abKAU
 D7Ara8LoGk+RxnSi1Q8LpoelNnkJDGoiOyGeL6yhQ96tNkUjpjk49tElFxg0xqK5tqmc3zhaSSi
 TOip7rhkAEjwNbrV5hXcbJecHaUT25j0VWjrIlouwtBlbxEE/dAIynfr56QNduQ1ECXfypDbAct
 KAI2fq5ImPyXklMq78QEZUMzBXlKPl59wo7cZvtbkEJj1jBpVeB5kyD7E6NwNbHV2AwupJOihuh
 8itpsWWsVWcdXRF2W3ETZq98785KiD7MlE8atsI1cUDKvIQDzwiAIoKfIy/bKRMMQQfNmflib1X
 Lv1p1wHETcRekPTM54A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170095

On 7/14/26 9:19 AM, Mukesh Ojha wrote:
> All existing Kodiak board variants run the Gunyah hypervisor, which
> means Linux can only boot at EL1 on those devices. It is possible to
> boot Linux at EL2 on these devices [1].
> 
> When running under Gunyah, remote processor firmware IOMMU streams are
> controlled by Gunyah. Without Gunyah, the IOMMU is managed by the
> consumer of the DeviceTree. Describe the firmware streams for each
> remote processor in an EL2 overlay.
> 
> Add an EL2-specific DT overlay and apply it to Kodiak IoT variant
> devices to produce a -el2.dtb alongside the standard dtb. Modem and
> media subsystems are not yet supported due to missing dependencies.
> The GPU zap shader is disabled. In EL2 mode the kernel owns the
> hardware watchdog, so it is enabled here. The wifi-firmware child
> node describes the IOMMU stream for the WCN6750 firmware; the &wifi
> node itself is left untouched so that platforms without WiFi are
> unaffected by the overlay.
> 
> [1] https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi
> 
> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

If gunyah reserves gpu_zap_mem, we could probably shave it off too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


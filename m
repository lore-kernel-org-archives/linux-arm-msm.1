Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218842;
	b=bj5L1fdeF6onbDGkkjxWrfBXTZ95k22x5MaKNPEbj+DWjoCM/OxXcWX0oHl84XbmXyEI
	 jvcF/SQPlvToHySL4CA8tdSxfgaINqUQBUVNgyikoXkKatvtzscxBWvL0nmQ5CLSfOMFG
	 w2NchVgFc9lt3j5dUksRmvN18YJqvW3plzDqcodJV3vro/HLondessewU0Am59bwlBKsJ
	 HDbtnw/8fwEJ6u/uRKL9nH2VGaVe49WcoEcm/jm5Q//HpWGE3BsPpANIRVTb+X5Ewh0ca
	 7ttLLTfxX9oVVTiNqb7az0q1aZ5MgQOZ4gI1DKTSzauJY0Ai8xwbogyTkdFBS18BX1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
	b=W0FSkiTOyJiJp206UBEVGELl4EPp5kCfoSZyJFfCg2qnrP7LWeytNbYERXs154LJn6Y8
	 jhH+/o8PkLbW+EcbPVCzpJtQ7XNwusoCvwU235AJ4QezXp+alAOwcJ/eNLbrXpNnRci52
	 mdpAhGXsTqaWuqMYu86Ccdp8GAaiKEv1ODzRiIfNsW0Oy9ipVUcEI9mcz36tFx122KG96
	 r0gfgJ0o/9pgH8IWYa8DGDXbl+xAHGcAmJRTrxSJXG+JZaR0xX3Mz97Rm+kjb4ht5zaV7
	 iUq/bdU3H6HR/i6CSsyM0k0JNJa2ncydZ2f8os9X/p1JjYH7BGdrOcpZk/vO1gzyaYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="a9of3/qL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKYi8J97;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95868606A325
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 10:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95868606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9of3/qL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SKYi8J97
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ulj54130921
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 10:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=; b=a9of3/qL/4+MO8WB
	lGHMVmTU62rb7WextgOeaYfECVNulD+JxEQXiv2o+3WOcNDeConh4zHrNfl3wtP1
	dmEnFp9YlHwyAZ40/tqS8Zkb+FYvJ/SVdmXTQH4q15PvZ/t8MYHf45rhiN1JB//c
	AJ9xFAQaPE+q29gR6sjkoBSwTyvu9b7EtbGHTDxqvTdkviR5SJ4yMPYRV2ZuwxCG
	UveAyYACnh2FZJePJhAHvhUOVNOXqWIcYv0/DjUa+tfz0eAnQTqcESlF3giJ5pOa
	+Y4BucgJ2WmW0NgK+P9xS36u43OYJZqgjm6bdT6twduSjkB5yHQyQUOBuacZlZ20
	BbSGMA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2h5rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 10:07:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so708572a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218840; x=1794823640; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=SKYi8J97+2OgxoGsD780fr4IeIDgPlFJR5NTDW14l5Ay7saa+/U1gpCuwdE3WoTP65
         zebf1Qm2kEmsALB8q/mtta3rEcyUwf976yYbgp7E+WspdEuy98bAAM1bVxVjewUuT2Eq
         JNrtsc3zGPilX/U38DdnefAvvTMC9IqnbjRcalyV9msmUNf+XaHtdFItGUcibhnPtCLC
         DKGPLxPKkSJiEw1o7OeReEsMTL9WlwTTp+RescUmHVEGj5u+JO4LaD7rQohsXey4tIRM
         WTaNFTTkVbu5Rw+v8HFO8x3s59b0Vz3vmy7S8q8NjeMJIVb5DY875RvZQoUtgwr+O42F
         2MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218840; x=1794823640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=Kg4L2PCRxDXSwkLb/kVdPucIQ7oTIzqebt5rrZny+9yp+xcUecEp0D8XOIrR7eoapt
         IaYu5lZpD6dFWHwa+AruvTr0tbb1FvGtQO6mrtmZ/EDviW9FEYe7imiNPMrSIEG+pM4M
         jQygyfwmlktqbFeAKJ6WkTQ4K5ILcxm0c8Vnk0aiTgeY3L3M2a8Lft8exYdxBQMRdTOc
         lL4kliK5rMFXD2W4zfZvQu4XsJ7FEAeDbJRuyeXOpP8zinx6fJrqVuuYLqShHAIUjdxu
         e2jPmaraLrjA3Z6lVGAWsEROri6NcRdqD5sAQsr1dK4hu05pcp5wUQkqTECbaVPyWCGC
         8nbA==
X-Forwarded-Encrypted: i=1; AL+hErGvV+d+i7tvd0bHj91UDI42j0lsgDKRNaU5p8EmAsn5HQ8PTkSSw4ZATBw5MiQPH7u3Ijuo/VeRD51/++Da@vger.kernel.org
X-Gm-Message-State: APuU4Z98SqgeziWI3HHYOy28WXoURgZ475RL1W3KUhc161kCL6fvurTg
	e1UQH3sIiU2DXde4URAD9Fz3L/Vq+7Gq60+J21QWj9Hh5XhhUb4rjIqHpO3QIy3TvgbQYCPz3gJ
	uGUILBTiSKprDN4tl7OQr5y86pNtvM9ElQ/OgtLmu/tZo1GFMTTfmcXodpIydjrM97WCT3SR+qo
	lr9Dw=
X-Gm-Gg: AYBFou2fNNw+xgVN03Xkd+W5TC/6lIoonCjoMKygSXdhDHD8+vGbCvo6UGNmTvk8iGw
	cHaeZzuBQYeObj6nGMraYRQv7Zn7DnQX35IJgcZYZWJISR21diJtAwLYiaq0Yd5pN7kNdqku4C9
	cNjUn5zSyV8yml++j7AX5lUhx0XOeOcwP6dHv+iZuCTVm/bTYYyUgTVKpqiLuj9YOSP9Cs1tF6M
	V35K+fMf9Lshx1FS++UG/SgjdscQeqjE6Z7FVx4iwJEpvtkHECzFGPQtxUyiN9pr52MipKk7Jzv
	x0xl5mdamX5wksh4Q9sUND0iExslZ6tfMIOkVkh3GyeUSYi3eMS6r/z8TxD11N/Yhh/U7hGJG7B
	udCwA+6GQQe+F/Z02UGE974rcU21GkDN28hT1Vvwt1iC7P/su82TogjXnDFweDu49MJbR5hbFqA
	Yj7GsvOvo+FqVWsE1o7k3C9d5+nXtT
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526905a91.32.1794218839551;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526877a91.32.1794218839087;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:33 +0800
Subject: [PATCH v5 1/7] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-1-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218813; l=1221;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=dTfzizx2O8pIWKkNOZ5/tj+tagXJPodOMUlPeZeSs18=;
 b=WY70CK6+b3HD6F8igEKO8LA8i7n1vIrZlsEcst/OXcFuilQ4b/kjdatXb+vwpsWJnrgAaH+bu
 vPCzTswnJ9zAht0xJL7Sy2MaO2ckK12jMWNndpRwzyY4PojyLFaYyPH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af19b58 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXxwH+yhKNI2v4
 69TXmWpXWXfwcH3Ysdb0TxgLQlhkZXDHSBZquREMbOBETF/ppLXAtootXB7hsnDebNsEwBZpWDF
 juKaiC8fBu/lfI79zOUnv5pqSFEzwA7pS8WiSaHz4YKgub5/mIO5U2pczQxUkch4pzEFcTEHTDn
 KTbcLquQ22Z5v93VR8G/WoMKy+tMy5+BONZ46/4hhsLWZmu2H2bengJHxSneFkthbW3TOpWVN41
 KuX/g1az0V4bI1U8SVIDKtOwc4KYM0EVuAW96gStXSQfKddRQqvvH14wnA5wK5Iq1QglU9tWqFk
 UaO3smwzhr1bHHtZh+/ZsFdLFwpdZEChMggZY5GppTOy7q5kVdn4PoRoD1Y+IRuSHpr92rkvty0
 QfbRbueee/oclKJzhStv2BR25fY+EtufhFkdVa84Y06kE47xThqmo0CcR1VEVPmGULLPMJRstTH
 BWFds9vA4Iaf6xVhJpw==
X-Proofpoint-GUID: dbaUEUS-r08ojotQMvT7gCjJiKhRGxVu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX6J0PQuUj6Doq
 ikOV0Yc5pQYRNu+K8UjSp1HONlPwzAR4tx5m88YRKGPh2zOgpoFU5SQnM7MenYGV/djLhfhPK8A
 3SUuztJg4VtdrUdMNbTCMqPCIAB/ZWM=
X-Proofpoint-ORIG-GUID: dbaUEUS-r08ojotQMvT7gCjJiKhRGxVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Cc: stable@vger.kernel.org
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..05f785328dc2 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1


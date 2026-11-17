Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900839;
	b=VKro1NvNfsPHxBAIfzLfRuKFHl4REtWrycTop24hPNjTiHyMBCo0OL5FMjJRXRWOyw+q
	 3j96vuLazSZLJsyg+vdX/YIB9TgqwheR5kJzPRvwI4JLUXs91SrKXlCPHDot4jv4moCwL
	 qeNTmGYOHNA/V9uDOKozHmb9OKKdodn8YXru6l3iAqhmcxUohEEWG1elNNadn3eaAW2FP
	 JBpXlXdQRs5KcnZyJbG1w08Fi2HRAVgH5F7Gs4PHF0KmxLl+8NSiTW8/7713OgZocY7cV
	 B43ge1Ur8nYdWtD1+UUwUN0/3jFOuovKRgSSEFBTxTJmZSxibgB+oA1nvxWLOVF8a2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
	b=QbhX6buGJdGDO7vR0TW/lMJkC+XNoU3aeEKCvrJI6Oo+kfM38KmMInnSq6I+pD3y5Vpt
	 f7YdA84u7acuLGSnEg+Iq5V1LVnpeT3IpgRY3XD8YCRa+M7OM/5UeORp//YKpPufq8iyE
	 Nv4RuOvHCjcRYpgzi9uewt7jhSlOqeNwr6rRJ8dRIdVPl6tOAWsQq162khwn3u4KudhV3
	 OztI//oll2FCJtJUWAlr/OoZwlS8gogJhTxDrUhIDXjcq1Rd78iLJhWpa1nDNMZwEMqs6
	 rq4mvk6eCuY6/08WOLFPuNvKBppnPcbW1Ax76VAI58ev+wC15o7w8c+nv7jR8uQTRgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwjPPGUI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WWMYDjjL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B1606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C6B1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NwjPPGUI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WWMYDjjL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LfPt3980581
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1/fBRI3pieX
	AuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=; b=NwjPPGUIK/KNnFUG8i12jWoI4Cy
	wQDUBpY0kzWDXQAOKfqSUXfM40sQ+iJYmDVfpfAGKWbXDWHXprQpsY0NQMg/5sPP
	KGrYnmcCoqbebnvalgc+LWplle8cwV1fwkzSzClF6dEWs/JzoHBNqvPuuNTSvRfl
	ya5pz5P6CiGocOlLg8uzTHD9DJv23e3xCWv3uPGoFpYRMftm8QYPP5JKHKJ0wzxz
	21LWfZpVW7LjpRetHKkru5XcWgMGeu726/4AIXkQ3HcqyxHTjSxwvg7qlGVXFFcK
	dVdBMbWncQ+QYc9qFX4iPUwhf6PoJYxtGGG7N49EbmPEefEZgluWI7iK+wA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd08bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:57 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-851f720d7afso2514940a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 23:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900837; x=1795505637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
        b=WWMYDjjL9kCP+I031WvvR5p2JvtcXBjkCmntosyyDTX66Ogo1oZOJkt9gYzEdY6IOj
         +CbVvHlHZL/ASkvgIGQj7u3+BPqq4CzLCu3FbqTRvPZwIFKyFDKJqv1XovDWiXxY24oL
         c5BbYLdQOz+ejwZXezzjdjxoYFgnuSdwu9qWMhfRKmdGoJSLW/WrT7CwzEBFE/fdK5EI
         ElMLq+iOWe3zMXmdkxz8vteiYRKoos/l7ocHxjT1nKoaBQ5ZsOzOggmN7L3Tvzm6oZYZ
         zL2wVwG01f/2vXALy5PnMbwkWUKUWImjNLX8m4LXJrJ/3ohPA+ElavNnZGYMT5eG8ITQ
         kaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900837; x=1795505637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/fBRI3pieXAuTyyYb+E3JIOfhMoIV8YX+Ub3Q+F2cQ=;
        b=Lv8f4N3LDTn4OfCFYReKzTe+VGVCgE3oUcVsJeJpCO5ccBmcMzodyERYWrsOgIm9Ku
         QoNyyG5hme1Gt59WqgBxj4/AzzItHaobB+6yIlltl+OGgjiDsYrxj2CkIND7pJprEJMl
         hPvnOZ7Kv7fedEdrhxA+XAaGYCwiwhyJvP+wB+asYL9WC+ZIuZC11Dqn6/UycdktJcLA
         dG7YsOixyGgnl7C7LEdtHG5MiqeLaIPtS0oa/PJ/y9vV3d+NMwxE5lyvoPKU9Cq16oIj
         Nt8pSIxudsopmtIPyLEigxawxl9l7MAjei3++VMnmLg0fhW5CbOMQidZ78DyzHFBZJsv
         AdIA==
X-Forwarded-Encrypted: i=1; AL+hErHxZ2nxL9Xmj2pJKPU1wGCNzHt8GlQGekk692zqj+s6FKopAPnCtzb4yGrQDdIQvqwgtjKCT2YdrxYW+ZTF@vger.kernel.org
X-Gm-Message-State: APuU4Z+ED/TmofU2nyGPRzLqZLwjNbGr1fleZUBBqFjOOmD9Q/k30WSz
	M7mlj0qmUxek3o25cYXgf0ftjZwUN2Lt665n+Xk0gFYKZx3S2wBA3KWPw9Y+fr8S8Rk9J9cycwM
	6yFdjQcTh0ywgomgkc5YraGSW0ahW3cxyTeYUTlHUKrf/codZfjLjJQ2L6pjVYKQFrnPn
X-Gm-Gg: AYBFou0p3WHKjl3DU2jkW6CrmrpnYpwrDtPjaGQ7aZsAfs+5e7/6cXD4UgPV9dgp1K+
	oqmEM1T48TfkbRcX6fNHrW5JSpRYMRfCup6bm+3N/2YD9ctqtfTkSU0QXfyPViZZlIH82OI3bbz
	3hILTelDix4mQpXQ0+pN037J+edhcE96hCPp3MDCc+uwV795qlsy/VXxKOoAZy9j0VhybOB3Y4P
	IRU80lUf3/npGLcMCGFipVb7b7yBJYoIf2v/kgmZBL0D8a8Qztee7Skrn+8PK373VBmsbkQBWTU
	bkhyaSThO1EAm47e9gf99wNKJ5XMzo3YTcztkPPq3jQoKQtlZCnSvcGZG2jUtnH/HnmbZnPC1EZ
	vWrXZAxUSjerrDBNIhxyF4eJ6t2UISeuTURXy8Z8ei5Gpi34mMNWv36ODnKDGAtM8l5C3b9/fS/
	q1BpN4ZpkpKeojZyRxG3a62RJXyxFgx5m9sg==
X-Received: by 2002:a05:6830:3911:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-86289962855mr12925772a34.28.1794900836572;
        Mon, 16 Nov 2026 23:33:56 -0800 (PST)
X-Received: by 2002:a05:6830:3911:b0:7fa:ab72:9e04 with SMTP id 46e09a7af769-86289962855mr12925743a34.28.1794900835877;
        Mon, 16 Nov 2026 23:33:55 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:55 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v19 7/8] qcom-tgu: Add timer/counter functionality for TGU
Date: Tue, 17 Nov 2026 15:33:04 +0800
Message-Id: <20261117073305.3854951-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc0365 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=uUgUC8Xt-bfeVmmxO7MA:9 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXxU9Ea6NeX7WE
 MhZnz8MQcnTITOYWqV+bitB7zdJUHbsWDILnKBCEpk87+rPJ9+yaq9h//B2prl02YRuQuVnHmOX
 5Ulp61IrMLWvKj8l8srY7SwccaCRUdw=
X-Proofpoint-GUID: Pbt3BfNYCVIptukT6rlYW4XbvP8H34Ix
X-Proofpoint-ORIG-GUID: Pbt3BfNYCVIptukT6rlYW4XbvP8H34Ix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX83Ti1ZhnAbv/
 o4aQ6WUvhmboDghoqg3BhS8/X9hz7+48M/jZFQQ/7fbmMvSXp55j96irSUvEoU900liwsrTygk7
 T0WoV204bLHDnWwve1UXV1r0rwtmnxe+RmbZBha8O54fwJW2kH4nvijiPehlWbJfNoD2tWvO4fa
 VKeCUrzboZ+PJOxfoLhQnMsaA4WsGvcoXfW2/wvhk87yeOjkcWK63ROk7+qTCDqfiNLGpI6t7mv
 UAOeZN8h64e2a0V0tSuW/NobshgkGR0ZgqhjnCi1UCCiHKC8Do+BNyRmW0x3+FFLdgKtPe3oBXM
 uH1H1BVnQ5j2xgxHCCW8JaNHuKFDtbhPgr+0+ZqeyuYB6g94ETfuOXiSNUfuESIEMGgOTLVTb8c
 OgnUeBi99rG3RP+VYBwnrT8tTfmangbrrO75+GFVCseezRecLEIB7pJ1Or1crCJFVBDI/We3AKT
 WVVkjP9pWZkrVsBG4Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029

Add counter and timer node for each step which could be
programed if they are to be utilized in trigger event/sequence.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  14 ++
 drivers/hwtracing/qcom/tgu.c                  | 120 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  |  39 ++++++
 3 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index c30b58166a0f..71187071cbc8 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -37,3 +37,17 @@ Description:
 		(RW) Set/Get the default next action for a specific step of the
 		TGU. This is the last register of the condition select region
 		and is applied when none of the numbered select registers match.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_timer/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the timer value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_counter/reg[0:1]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the counter value with specific step for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index dc4e60380565..5045c0f344d0 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -63,6 +63,10 @@ static int calculate_array_location(struct tgu_drvdata *drvdata,
 			reg_index = drvdata->num_condition_select - 1;
 		return step_index * (drvdata->num_condition_select) +
 			reg_index;
+	case TGU_COUNTER:
+		return step_index * (drvdata->num_counter) + reg_index;
+	case TGU_TIMER:
+		return step_index * (drvdata->num_timer) + reg_index;
 	default:
 		break;
 	}
@@ -105,6 +109,12 @@ static ssize_t tgu_dataset_show(struct device *dev,
 	case TGU_CONDITION_SELECT:
 		return sysfs_emit(buf, "0x%x\n",
 				drvdata->condition_select[index]);
+	case TGU_TIMER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->timer[index]);
+	case TGU_COUNTER:
+		return sysfs_emit(buf, "0x%x\n",
+				drvdata->counter[index]);
 	default:
 		break;
 	}
@@ -150,6 +160,14 @@ static ssize_t tgu_dataset_store(struct device *dev,
 		tgu_drvdata->condition_select[index] = val;
 		ret = size;
 		break;
+	case TGU_TIMER:
+		tgu_drvdata->timer[index] = val;
+		ret = size;
+		break;
+	case TGU_COUNTER:
+		tgu_drvdata->counter[index] = val;
+		ret = size;
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -199,6 +217,18 @@ static umode_t tgu_node_visible(struct kobject *kobject,
 		if (tgu_attr->reg_num < drvdata->num_condition_select - 1)
 			return attr->mode;
 		break;
+	case TGU_COUNTER:
+		if (!drvdata->num_counter)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_counter)
+			return attr->mode;
+		break;
+	case TGU_TIMER:
+		if (!drvdata->num_timer)
+			return SYSFS_GROUP_INVISIBLE;
+		if (tgu_attr->reg_num < drvdata->num_timer)
+			return attr->mode;
+		break;
 	default:
 		break;
 	}
@@ -249,6 +279,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 				drvdata->base + CONDITION_SELECT_OFFSET(i, j));
 		}
 	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_timer; j++) {
+			index = calculate_array_location(drvdata, i, TGU_TIMER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->timer[index],
+				drvdata->base + TIMER_OFFSET(i, j));
+		}
+	}
+
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < drvdata->num_counter; j++) {
+			index = calculate_array_location(drvdata, i, TGU_COUNTER, j);
+
+			if (index == -EINVAL)
+				goto exit;
+
+			writel(drvdata->counter[index],
+				drvdata->base + COUNTER_OFFSET(i, j));
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 exit:
@@ -260,7 +314,8 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 {
 	int num_sense_input, num_prio_regs, num_step;
 	int num_condition_decode, num_condition_select;
-	u32 devid;
+	int num_timers = 0, num_counters = 0;
+	u32 devid, devid2;
 
 	devid = readl(drvdata->base + CORESIGHT_DEVID);
 
@@ -308,6 +363,21 @@ static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
 		num_condition_select = TGU_MAX_CONDITION_SELECT;
 	}
 	drvdata->num_condition_select = num_condition_select;
+
+	devid2 = readl(drvdata->base + CORESIGHT_DEVID2);
+
+	if (TGU_DEVID2_TIMER0(devid2))
+		num_timers++;
+	if (TGU_DEVID2_TIMER1(devid2))
+		num_timers++;
+
+	if (TGU_DEVID2_COUNTER0(devid2))
+		num_counters++;
+	if (TGU_DEVID2_COUNTER1(devid2))
+		num_counters++;
+
+	drvdata->num_timer = num_timers;
+	drvdata->num_counter = num_counters;
 }
 
 static int tgu_enable(struct tgu_drvdata *drvdata)
@@ -487,6 +557,38 @@ static const struct attribute_group tgu_common_grp = {
 		.name = "step" #step "_condition_select" \
 	})
 
+#define STEP_TIMER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_TIMER, reg_num)
+
+#define STEP_TIMER_LIST(step_index) \
+	{STEP_TIMER(step_index, 0), \
+	 STEP_TIMER(step_index, 1), \
+	 NULL                       \
+	}
+
+#define TIMER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_TIMER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_timer" \
+	})
+
+#define STEP_COUNTER(step_index, reg_num) \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_COUNTER, reg_num)
+
+#define STEP_COUNTER_LIST(step_index) \
+	{STEP_COUNTER(step_index, 0), \
+	 STEP_COUNTER(step_index, 1), \
+	 NULL                         \
+	}
+
+#define COUNTER_ATTRIBUTE_GROUP_INIT(step)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_COUNTER_LIST(step),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_counter" \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
 	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
@@ -537,6 +639,22 @@ static const struct attribute_group *tgu_attr_groups[] = {
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(5),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(6),
 	CONDITION_SELECT_ATTRIBUTE_GROUP_INIT(7),
+	TIMER_ATTRIBUTE_GROUP_INIT(0),
+	TIMER_ATTRIBUTE_GROUP_INIT(1),
+	TIMER_ATTRIBUTE_GROUP_INIT(2),
+	TIMER_ATTRIBUTE_GROUP_INIT(3),
+	TIMER_ATTRIBUTE_GROUP_INIT(4),
+	TIMER_ATTRIBUTE_GROUP_INIT(5),
+	TIMER_ATTRIBUTE_GROUP_INIT(6),
+	TIMER_ATTRIBUTE_GROUP_INIT(7),
+	COUNTER_ATTRIBUTE_GROUP_INIT(0),
+	COUNTER_ATTRIBUTE_GROUP_INIT(1),
+	COUNTER_ATTRIBUTE_GROUP_INIT(2),
+	COUNTER_ATTRIBUTE_GROUP_INIT(3),
+	COUNTER_ATTRIBUTE_GROUP_INIT(4),
+	COUNTER_ATTRIBUTE_GROUP_INIT(5),
+	COUNTER_ATTRIBUTE_GROUP_INIT(6),
+	COUNTER_ATTRIBUTE_GROUP_INIT(7),
 	NULL,
 };
 
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index b51bc47637e5..b5bf9a301a6a 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -18,6 +18,14 @@
 	((int)FIELD_GET(GENMASK(6, 3), devid_val))
 #define TGU_DEVID_CONDITIONS(devid_val) \
 	((int)FIELD_GET(GENMASK(2, 0), devid_val))
+#define TGU_DEVID2_TIMER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(23, 18), devid_val))
+#define TGU_DEVID2_TIMER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(17, 12), devid_val))
+#define TGU_DEVID2_COUNTER0(devid_val)	\
+	((int)FIELD_GET(GENMASK(11, 6), devid_val))
+#define TGU_DEVID2_COUNTER1(devid_val)	\
+	((int)FIELD_GET(GENMASK(5, 0), devid_val))
 #define TGU_BITS_PER_SIGNAL	4
 #define LENGTH_REGISTER		32
 
@@ -56,6 +64,9 @@
 
 #define CONDITION_SELECT_BASE	0x0020
 
+#define TIMER_BASE		0x0000
+#define COUNTER_BASE		0x0008
+
 #define REG_SIZE		0x4
 
 #define STEP_OFFSET(s)		(STEP0_BASE + STEP_SIZE * (s))
@@ -71,6 +82,8 @@
  *   TGU_MAX_CONDITION_DECODE decode region 0x50..0x5F holds 4 u32 registers
  *   TGU_MAX_CONDITION_SELECT select region 0x60..0x73 holds 5 u32 registers
  *                            (the last one being the 'default' next-action)
+ *   TGU_MAX_TIMER   timer region 0x40..0x47 holds 2 u32 registers
+ *   TGU_MAX_COUNTER counter region 0x48..0x4F holds 2 u32 registers
  *
  * Each priority level's block spans a full PRIORITY_SIZE (0x60 bytes),
  * i.e. PRIORITY_SIZE / REG_SIZE = 24 registers, all of them implemented.
@@ -80,6 +93,8 @@
 #define TGU_MAX_PRIORITY_REGS          24
 #define TGU_MAX_CONDITION_DECODE       4
 #define TGU_MAX_CONDITION_SELECT       5
+#define TGU_MAX_TIMER                  2
+#define TGU_MAX_COUNTER                2
 
 /* Maximum priority that TGU supports */
 #define TGU_MAX_PRIORITY               4
@@ -93,6 +108,12 @@
 #define TGU_MAX_CONDITION_SELECT_SIZE \
 	(TGU_MAX_STEPS * TGU_MAX_CONDITION_SELECT)
 
+#define TGU_MAX_TIMER_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_TIMER)
+
+#define TGU_MAX_COUNTER_SIZE \
+	(TGU_MAX_STEPS * TGU_MAX_COUNTER)
+
 /*
  * Values for struct tgu_attribute.operation_index: TGU_PRIORITY0..
  * TGU_PRIORITY3 select a priority level, TGU_CONDITION_DECODE selects the
@@ -106,6 +127,8 @@ enum operation_index {
 	TGU_PRIORITY3,
 	TGU_CONDITION_DECODE,
 	TGU_CONDITION_SELECT,
+	TGU_TIMER,
+	TGU_COUNTER,
 };
 
 /* Calculate compare step addresses */
@@ -118,6 +141,12 @@ enum operation_index {
 #define CONDITION_SELECT_OFFSET(step, select) \
 	(STEP_OFFSET(step) + CONDITION_SELECT_BASE + REG_SIZE * (select))
 
+#define TIMER_OFFSET(step, timer) \
+	(STEP_OFFSET(step) + TIMER_BASE + REG_SIZE * (timer))
+
+#define COUNTER_OFFSET(step, counter) \
+	(STEP_OFFSET(step) + COUNTER_BASE + REG_SIZE * (counter))
+
 /*
  * Neutral ('NOT') value for the condition decode registers. This is the
  * driver's default so that, before userspace programs a real decode, an
@@ -140,10 +169,16 @@ enum operation_index {
  * @condition_select: Per-step, per-register select values (including the
  *                     trailing 'default' next-action register) staged by
  *                     sysfs writes and flushed to hardware by tgu_enable()
+ * @timer: Per-step, per-register timer values staged by sysfs writes and
+ *         flushed to hardware by tgu_enable()
+ * @counter: Per-step, per-register counter values staged by sysfs writes
+ *           and flushed to hardware by tgu_enable()
  * @num_prio_regs: Number of priority registers implemented per priority level
  * @num_step: Number of steps implemented
  * @num_condition_decode: Maximum number of condition_decode
  * @num_condition_select: Maximum number of condition_select
+ * @num_timer: Maximum number of timers
+ * @num_counter: Maximum number of counters
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -157,10 +192,14 @@ struct tgu_drvdata {
 	unsigned int priority[TGU_MAX_PRIORITY_REG_SIZE];
 	unsigned int condition_decode[TGU_MAX_CONDITION_DECODE_SIZE];
 	unsigned int condition_select[TGU_MAX_CONDITION_SELECT_SIZE];
+	unsigned int timer[TGU_MAX_TIMER_SIZE];
+	unsigned int counter[TGU_MAX_COUNTER_SIZE];
 	int num_prio_regs;
 	int num_step;
 	int num_condition_decode;
 	int num_condition_select;
+	int num_timer;
+	int num_counter;
 };
 
 #endif
-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC154EF12D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717728; cv=none; b=rItSOzqsp9at/BpCkZQK2DaN58J9b+fayWITpmnkwD7Og69iJe87Pggs2Ox4OhRIXPLDvDrFDx7xqwQI6AbKsb0wEq3IPfkXGlfW/68LQEZgCgonUBlFp2EYGOU37bxx2KztRm0Tu4MsS5Hf6E7L0acioin5A9nj9WbRXXqDNu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717728; c=relaxed/simple;
	bh=CPcxz2/VOvWAWtViNoiWgwxMugTpbWTs7rbDXCSIDRM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dEa8TLPk17XbVv9OXfcfu0hdsJGumFFJQ3+SynORZJbJoYi59vCEeTXqHVzuNc/Da4lSY2KTPAxoT8pTVeB1QHablabZ9EhwIQbqe/NpT+BolyVzCH1sLnCYbaNq+Ki6PONlq10xxkXW3805HMNTHM7s2zy1/pE1npAVZjJN5vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbbI+5pU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DyA7T/pH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbbI+5pU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DyA7T/pH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TI3uia1725137
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5t8ikYnzF7L
	NMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=; b=EbbI+5pUuEYeEWFzQkLfdOqBb9r
	57jd+IWs2QjkTmw89kSwc+aGvBUmg63mI3/nUsicr7xUzrn30xBOhegxH5CaPcRJ
	keirJkLIsYhl5B9OEOMVTKBSPnp0LtKWbGwyKaL5XY4ybUE5JjFkZjRaXE9zagrX
	TP55GFzrKmNxfrg232QezIFFBHybpYij3zv4pz5eLwqNAhMGQLErXH+WD4QOS6mU
	+0gQC0JLBH4ae6cNYjhjyXL6LJ1lcy6nr+J1Ug6BA3JGazLcDqD2D+eUJhoP875A
	2LRSgkblbFgPW4xA5vTwc0+1awhx3NOC0xa8XFTGdGyUZcMABBDLgLglL5w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97rst5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1384427c3efso6858128c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717722; x=1791322522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=DyA7T/pHueczU4xlfV2Vw9tU7JcdgaiCn069od89nebJEtC9V2uGUEhdpCnJLWnEup
         d0DkP3XgNEKFPLjAqC4I+S+ad4rl92R8xJqFCk8ehqTnP5TC687OVM0wtwjACS/r5gZj
         0OqkqzL4aS4XXM6D9YFb4qe8jQokEJAd+trENttL6jeAkW+WjmUNG3WS0XpsjedV/F0t
         QP5wRH5EXXnhVCnmA9ZQTkAOSU08JdKcyzWEZsLtSplGwvwW6KNpgjVm5i6+OUhMGUnn
         /jdncHECl783OWZEsbG05pp9tkXaHV+5/i0Cjyumakq4e1inf+D5mYNr9OGF0mBK0t4f
         LFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717722; x=1791322522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5t8ikYnzF7LNMYhBBKJ9lgwvuCIn7OqU//hH7kyyOfg=;
        b=OQLnGKElF7zmbqLVvmw46SIB6vcY558RrMsY7cYiFt3fS7kVVXeH3t90t9EL5ClJNK
         9AMvF85p+RVpbJB4cb/dUQYkUPGs3FbWAYQAZFVk9IZnuR+Qi6R1EuEPAnhBYkhWHZqT
         HlfbxUHwPNKHrnmDPxX4Qu01YCs2JZEM8oOEhPmG37M7xU4MuRrYxekx+BxuSY6T0MTQ
         85FB4S5gFVRZ3fCdBUAJlRBxcbaAhC0D+/v0pokeyyJOQ8N70gr2vtKdnji11oXRBuB4
         iTCXssNfSw2GqKVE8CyskZDvqV2JwFVOHYWL9uxWfwWPQcH+fZOExw0uAmGDgPNEOkEm
         +upw==
X-Gm-Message-State: AFuF++mIhYPWIVTEiup6AOV/onSuKAfbXClp7XeqVd7ZAH/t3gY+mpGN
	GSucMukznsuZZKkdxc00ZlzHAGWMrWzD1R7EqmNsDpD2uAPdxgc4oaTDE8qZK8Q7pn0/jzJZbD9
	gxtAfL9MaOM4o9l5MufIQh5vH82S/u9yljQOTXod46+tt5g79OpDaGtd7XgyhsWMnGWRr
X-Gm-Gg: AYBFou0yYJuX3qiFZ3fFf3p2Yao/WuUOBc+mX7GRekH3j6ndQfSfvMqDy/Hz2pTzcBG
	3q/KGZcs6lvR9S8IcQVuatOnG7GtVJz1yiauzu7EJKNCuEkOIy9krHnN0eBLNzOZd4OWgllAgLC
	CrXf9zG6lhDCTdcwPKV8Qd8KmzVsqDwXV+Em3WPlk2d//6PYUrBYrlrl2BHR3qDZoV0IkmNMkqG
	AskXe/LVNSAL1dHJ4xmbVxyciEphaefWubbJ5V0jmigIcmqeXh9bwTWg2OaOERSbedVRIjCfyt3
	sLVCDjw0MikOgYni9YO2QoNO1EazmAuF74ryUP1j3nNceTaPUNItu2UJmS/b8ozLhthn5IK4KPI
	xurDDzQs+C1dmnVWZUfXajh6rDtKD+KTi05RK8yP5mwxkFLgYwJO9
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576253c88.38.1790717722432;
        Tue, 29 Sep 2026 14:35:22 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8a:b0:144:c128:4c4d with SMTP id a92af1059eb24-14ca00a17e5mr576206c88.38.1790717721869;
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v9 5/8] usb: misc: qcom_eud: improve enable_store API
Date: Tue, 29 Sep 2026 14:35:10 -0700
Message-Id: <20260929213513.2401005-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VUHaWxAmq99dUI8pRoCklVibN3EyP6Fw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXzuScDCdgTFiF
 BSOQIKUp94uxRGhjwaJ1IqrmHJ6LBZvKqiFWRkD6MzBoAo4ItK4PLrPY4qGo2qnhTIveL7qgpiK
 hKOVribXf+44DlE14cuKmFecxXiBbQmlql1mTN/ui1TBZrejVu8zlIgNptZLEiurlpRnadm5Qu7
 xdUt9OIsuA06MV7wnA9kkrMYlx6SP+KxJb3wG7ev/G5Yq8CThaUJ/eHeXZtuJiMg+6C93z7Af5R
 whNGfqCpnWDajnoXjeb0uEYjb7Qw9FJ3/McX6MaUScxlbRSroJEqXOKUdbgkWUXE98ZgsPRkWb5
 R22Z1xtVV1og/L0+hYdoj28ELA+T6kQlByUgcZMofpX7QGrN4Ht3jpxZhdBXzG7+acu3KnQlK5L
 AHWHB/1Kmw7CqNEwYPIzKo/P3vFPLf9HabZDs13SeEY1y+VNAQU0qf6rHoz4ipsI2QDrQznr4Ok
 lbI21mu06h42vpHNg7A==
X-Proofpoint-ORIG-GUID: VUHaWxAmq99dUI8pRoCklVibN3EyP6Fw
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abc2f1b cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX33KqbmOaJzi1
 82v+3LBMgtg5aHvbgXxJqduNvYtZJkTbxKb2/hdPf0QfhmC4bDfEE8wxV4FWO4jcBRzwDNlQkMP
 oOOaCTG/KKatCDgXEpVci7jDkBXx4qM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290086

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 48e474bdf818..e227d05cfecd 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -164,18 +164,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268085013C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565602; cv=none; b=k1cViaQTAgd7MoCAOv7zTpK4cMBiuA67wu2TYufFIivTlxz+LJTqE1hADjj+JbqcXfA21ZoJ5SkAtE8Y9Fz3STc3N9K6FRcJVBUzeNhuVDPx5ma4cg2b+NU2RYQm3LjTRa32RTmiPeuz/WJS3BRufB5HjNxfURkTOz7uezloNwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565602; c=relaxed/simple;
	bh=pSG/TrwXhQ2SDtoVxMKdzFoXta17jnhiWAGC9pF1ycE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WIczubTDgA6bueRQUtAl6lT33y2INZNgm+Pgd3WTxQTuk/OETf3BHXw9db6X5hziYFGtXqgf7tEL8XhiTsoi4SQW+Ngwwbwx8grmSOUtwEaOoITbq/bEA1y9L9ihTFe4RNd6mqD2JdWiegAuCl6Fk6BcNLy9XMFojw+Vt8Vv6GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+LUSMrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IajFUMuj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+LUSMrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IajFUMuj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYgd02053438
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WSw25v0bjyM
	ImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=; b=e+LUSMrRDwemHg4p3ifF/lzSPkU
	zt8FGkx3j9M+3A7eYDS6Spkff0SQ4hwBEsrh2+vJ3NP/xNWGQDY6aiISob6rRZ11
	GKoNfvIvpg4u4rN0R4suLbisqtCokQ8WYI/FCyhGDJNsOKTlrssw5PAK+Y40FBbl
	Ostu745vptMplsHY3GwU5g33+3YiR4MfwQdR5vtI2N8COs+F8DVwhU4bmD16YEwM
	lOQakvzEkhyIQOyj/1XfRlVc3wFU9Uq4qTixpS6xp9AJWRHkRz4Ev21DDsCj9Tbx
	Hub8xbfP2NczQ6bgBtrecHN6YQ/HcE4vUdBYbAYKdacU99wfTRM0PB4UX9g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqtn50c7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso75089335ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565590; x=1790170390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=IajFUMuj3YDDivI/ZNpbWu2zZ4zfHCxIerLxj9/qsXDpSlrfLL1GdI6bLOHPysux9G
         2jq0R6s9MbGicC42gzHmCiyDatbovPSfZV7pqsRfIVIaCTNcEa2DGYhRTN/9FkHvKQ8O
         5jf5uuZeYxJLz9lE9Kvuqd8WbIzmLD2p/vGEyAu+EZ9qkSJEZ4LVh6NloBdpOvLn/qkR
         pAC9v9L3bvwXkErSdPZg2W2HAaxONVrsTTwj42+c1kYxCZHKmD6IQHXeSZPhO5i/wuB5
         3Si4xxwt2nD2FAH7g6YQBt2DQPzX7l0mtl2Act9Zbk+6K3nOFaDpdv0mbX6Ja9lAvNJK
         PtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565590; x=1790170390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=qTl2KddaUqMysjCAKlt4J2jwx0bYFyC/7YlIIA1/d5yvoMQC+AVt9iHziYiTyVN9eI
         x8ko3gphCg9BhT7l3bH5Gk0vwRz1aaQ0Zx4Vj1BZ+iciQ/gmCiSRflhT002ek4/or1VD
         tj9fjvuYGMPa6fGv6E2JLiry5b5DWmduTMvhwRl0XWhen6BzrFVO2al5wdcOegdCMXh9
         3muOBTujtF4AnDZasRw4bJXUwsspAac1IqvQzuEkefd4V0l98AAczZbA1gguaiP3SrW7
         fqZ+SpblKq/4HRiTPsNUC2CUFnaBJl82y1qmkzIDy4a0rEa18WURFEqLV11AHYUuQXqR
         zY/A==
X-Forwarded-Encrypted: i=1; AKwUvByFWXysWQkYGwY2JlSPNTxanONrAsH+h/ynjr/y1ROB5AEaDEA/WNUBRhREGdlBDRlrwBwe9v9uoIYSXFuu@vger.kernel.org
X-Gm-Message-State: AFuF++muplhZnRlOg+HvahuFolqQsiLP8CO4p2XiFzf0fGjPjfpHUxY2
	0cCjBC66+qJBfPPEyx614se/yhxDJe2WZ+u0FKfaCBXzoHDmi3hM66uEwjt46IuYl2qFhAzQtHq
	swTVObHpwxRs5OBsmqBsogbL9lyCwDYAfskDbdYJzlaDrf/l91N8D82kPxMKKdHWd2Td9zt9yVd
	N9
X-Gm-Gg: AYBFou3Kc+c28tPwxb2dNP2k9DhKjAefXx4Wb408n+1dD9844qrEoKWlvaknUERHM/h
	WZLlT8A8Q1k4TTHZ9vSa3AMRtqsV0dyN4EWRmV/PcZujm2PCfHNm5DbC5D3Ux84Y1CekRxiFcpw
	dO3Dz53Tk9zeq47lnnBmJXA2ocrabbAjWe/ClL7cPsdc1kvHQnbczOIJrC41U0IXK5he6wn6Q10
	nRJAo+M6G3plTHUJDgL2AJKhnrQB+yYQcmC8JG07xCaVI8b3Kva49yVWPiaqb3d6SpgsVtUCw7p
	+s43R/31R3W/bzteK7ifpoTjLorhTrrNYcXa3XHwQkm0RpBmUFAYGQueYLvlykTKYtk8d93krR+
	UDI6gA1UF3gWNRT8c8N0eHxrU9YyriNNO
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60389695ad.10.1789565590185;
        Wed, 16 Sep 2026 06:33:10 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60388955ad.10.1789565589697;
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebf2e2sm12077945ad.42.2026.09.16.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for power-loss resume
Date: Wed, 16 Sep 2026 19:03:04 +0530
Message-Id: <20260916133304.3720801-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aqSVKL2riEdZfS0D@vbox>
References: <aqSVKL2riEdZfS0D@vbox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfXxLEzf6ocXzSn
 q1GzujXH2hbsLyT8dSEC0RsqUxdlDQMSWevRjvKkM64lbph+Y7As8uSBNoEMzMaYJBZQ9X3wsAk
 qehFbPHSxFRJLmdO6jsUvbywAdbX9UOmk2NBTkp8KFWUrsNXIoJQdE/J2/lp2Vjk1xSwMrBl6IE
 A57at6ZaTNHNwQYHZ4CDTUfCVTq9KoQumdxXcfFoSrWlb+X6UgxDXCWEB8ITv8LcOCaUV2z6XBx
 ZNuMsCq9fHiqr022OhXox1+M0xIXdypQaJuo+a17EL6+Tcy4st286q4OnplpA3XvJxMzURO2whs
 CdklxOq0tlp8361u8KnZBYT4pIOUd05EF19SiPXGVc/khN6sAHR1LSHWZU9WXeTdNxw+Dj/FO4k
 QhkC1ewXJUxVt4QGJg5s2GCettKo7RhszN/uC+aUXIrq0ynTb3cWp41KHu86zje+ppXo4zMrmnl
 jNa85auXFLbTPWdhWtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX3ZJOJd3lYdj6
 pZpiUh6Q+JIe2JH7/khL6HdSSkxKZyz3f14HYyVnI3ZLktW7bxmpG/Ukj1PUV5YZxM8pQ92DIH4
 O4jX89XU835oiIOc/AkC7D+vrRy1sno=
X-Proofpoint-ORIG-GUID: jKMW6bSkOCOb2SM8zZL0g-7MKUg2goYc
X-Authority-Analysis: v=2.4 cv=K7O3jCWI c=1 sm=1 tr=0 ts=6aaa9a97 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=hk5jl9konaNAbWeGehQA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jKMW6bSkOCOb2SM8zZL0g-7MKUg2goYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160181

On Thu, Sep 03, 2026, Thinh Nguyen wrote:
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1420,6 +1424,7 @@ struct dwc3 {
>>  	unsigned		wakeup_configured:1;
>>  	unsigned		suspended:1;
>>  	unsigned		susphy_state:1;
>> +	unsigned		xhci_reset_on_resume:1;
>
> Can you move this after dis_split_quirk and add a blank line to separate
> properties from dwc3 state/config fields?
>
>> --- a/drivers/usb/dwc3/host.c
>> +++ b/drivers/usb/dwc3/host.c
>> @@ -129,7 +129,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>>  int dwc3_host_init(struct dwc3 *dwc)
>>  {
>> -	struct property_entry	props[6];
>> +	struct property_entry	props[7];
>
> This should be 8. There's already a fix patch for this. Hopefully it
> gets picked up soon.

Turns out this whole patch isn't needed -- see my reply to Krishna on
this same thread. xhci-plat already walks the parent device chain for
this property, so I'm dropping this patch and attaching it directly on
dwc3-qcom's own device instead, in the "Support broken suspend for
SA8255P" patch later in the series. Both nits go away with it.

Thanks,
Faisal

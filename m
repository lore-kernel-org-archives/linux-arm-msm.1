Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC06391E78
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255338; cv=none; b=IZTJLF57agazb9tR25n+i40vh82l/sqZJqyHYZYs0vjn5oy6F2WcxtoVrzMkH5ehXVthcl/blvqbI/+gPiSTbpXW54HGUxuMTiEvwVcaNO9webXAOPukAZjpTBhAuLhuPgIhjJph5rFYgoeIUoPOA/B6K0nnDCh/wD0JAjhtVNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255338; c=relaxed/simple;
	bh=C8tLQCcUPVyl+nU7V9GvLsHmUI3vby175dXTcf2BV9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PVHqoeqBmrnhyxCHjQCoREcdS1JUpi5u24CRf/qSZHidgyCeg73oYZJbIwCXOy4+fEMe1XuUZfsAGUek9xCxFfSwam3CaRrPk8HfK4mmX70l96ZSRhi00H0MKYTZ6+/64vKZFPck18UDDL0cI019j3OyNzuwtRoDSq1f/KK8exw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOWetbHj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DpDFSXdf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOWetbHj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DpDFSXdf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KIJ7Tq1066010
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9e
	RT+Q7FR0=; b=DOWetbHjIo3hBlH5OepFF2/oJtZ9sj1U5SchZFWIhPK9l2Wv4yA
	wku2TSLme2SYWGRTyUNtwtxGkUq0f8aTT8+W9YjBaFuZpOgWkwL+Rz2rvIjMt2TX
	P1zt+CMJGxoNXfLp7KzLU7+Kw4EofrpCUqYwSW3R327aMkwwJJAqqBFCsZZfZ8Jj
	fU8em8swmTbbBkz0MJJ0YhWmzRC8HZXDhFL8dNdMIL3hgoQscfu/mUTM+hg9R8v7
	G5QZ4bXXVccc8858rLayGlRBhA3r6dA0wkJQmHmIStKX8ooYO1ISX9h+rDYa2afT
	Qt3SZFMXTU9KJRmo4htp0GnEV5FMMgZEKYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn8beue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 19:48:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e52306621so22523085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787255335; x=1787860135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=DpDFSXdfEfNgONTfhQMtyY2tw2z+CwAIXMIrBgknUDNC0eSVjk+1MsKKDHfApRE3Q8
         LJMIMN6dVgaKMm/J/PDqfBSeYjuNUC8sBtKm3RK3yfqb8wTQ6Ib1JoFVY7DUT6yPNIwo
         7ux9L259oGGOG5MY10ZaIiIznwWWXMChDGZ1OMbn4sgkpoAoUZhnAgjkPxcrszI6rIxi
         YYn2njU8RP4rBn7oIoyubLFoXHbojQt1w4CfiDEnchEwn+PlUMyIMWEaiuQtCKrGZxkk
         t/gBITvnsna//O2nLp2ijE6vWO8Mmbe02W1KHsPtVWKLgQ/eG/5JWNLzVKQbfNzfWf/u
         Hcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255335; x=1787860135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2Cmaab1c8skxG2XWMAOAO6+MfGSdVWYe9eRT+Q7FR0=;
        b=hpMPzv5ePf6GoPxv1lHKnlnRpQxpQNSQclfCbAMTiodvR/6gjRmrBC6Q5on1V4/wqz
         0gHzkwetoWayBmuGNLQuk8tA9HfEz4cZGiRFMQkXUl1in/vkL2Yr/1+IhaZ0O9Y9luhE
         sgk4UwJteHJC+aUxl4S/oOnHUxgYn39AhUJWj+tORaiGzzHfWifPUptmwPg2SxrfJFKo
         SOnrzxtg2drpmdF/ei6lmFOTxfEWaBZXgEU6F/56+FTD3d1ZGAnEi3xaq7xOACte187A
         Oejz1EfOu55mIxOltZYLRKWJUnISQhSTMfu19Y812rZ52v+jjxu0LjCo8yTERWP6Wuf8
         sEKA==
X-Forwarded-Encrypted: i=1; AHgh+RoljM7935GcJhoRhMPxSYp60ZyscgBSzis3SOMVt8s3x0MNhIlqd/yY1kZ+r0L+Qey9yW+Ksq5TyyvdjlSl@vger.kernel.org
X-Gm-Message-State: AOJu0YwgoPBzTZ5W8JIzk46Uv7YC2DS9/r3k3E3AiTPpLsS0XyUchCbA
	UYgIQxsTfXcpG6ntJVbDrqbaq3eqKlfLiHu4lci5oDX6hWEKi3/Ncwgoj+NTe+Y+6HyCF6XdhAQ
	GJlipJVXhywUu61xB+6vgRh/79jZ3Wfouh5UU6s9uMiQh0wlMfeQWYKtSVWbJvV7XZOPL
X-Gm-Gg: AR+sD10D8UVPj7FT2VXBpmaq2Djy3kSHU1JBW3WG4F2WAgk+Eb0P85duSZdAf+x1nk6
	genY0BwmzJgf5qDNV/6rZ2OTPoCjd5nZSie/hRuD4VatQdzWWytKVJb8d9ZD2coLzP3YfYbsNzq
	NL4swSNQxAt0zS8XmBcDeeyDY6ujqkpAeyEUtjrnLiOXOWtpi12RKnz+gY3XysuvZrlbhW8+LNe
	tjM75q0G4bFiN1+jsA95vtJ1Jk6E+ZZxt3GY9NDQ3OuBVci61DxUjhz05Pso18CT/BPuQYqqENV
	2TQUSDcmwDMeFOmOIRoh066GPGGsPaBkjYmudS8WjDZy4PQmtGrrx8dvBmuR3PEhvb8SZb5H5dN
	e85wY5V2VTjnG
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56868085a.20.1787255335017;
        Thu, 20 Aug 2026 12:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:936:ea3d:9313 with SMTP id af79cd13be357-93739497c75mr56863585a.20.1787255334517;
        Thu, 20 Aug 2026 12:48:54 -0700 (PDT)
Received: from shalem ([2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2459198ec5sm113433266b.34.2026.08.20.12.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:48:53 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] firmware: arm_scmi: fix module auto-loading
Date: Thu, 20 Aug 2026 21:48:47 +0200
Message-ID: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX3lonEUlNf6qu
 EE9Dm32ULoCfkfvGBZwlM2X0M0aiI/51BjTrSnFB6+/sBU+DaBtwTU9TurHeDE77qnmIIJO6ZOD
 SZw0lELPs2OsIshT+MAUXm2XqHxAnpT+xrccbQp17stVbfya7l2oyveCpFFq7yxHMuszDQWx215
 KbqzeFyMVKLXCPZFs1Qd4DSsXFbv1JtzLmNWgzDcmNdz3myoQdfoN6Mz3JHStBVCaBvcnmwyMAB
 kVEyFr9blYWraT9E/Ke8BZPuFOA5qAn42P8rPNOH17Ytqw+AfGs9T8SNuzKUkGaW8zy8XOo1p3v
 hxfrFqRTWojAjbU72rtvT9CuR6v6g9MOjGK+TaQRg2MebQeBaFdl0JUhfuqdV/EBPtieiFRv/WN
 l0uVKh8SuAMEfiOFxzjkmFvwGG+9ylS7wXcJI9TwrKw/E24RB72RewxJRX/tlvuJFPsI1fLblaf
 xrwD6SkHbEKv2VOpUhw==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a875a28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8
 a=7CQSdrXTAAAA:8 a=QYgjaYqrS4LJc6J_j6wA:9 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE0OSBTYWx0ZWRfX0wk4nFgeQ9Fn
 L6SRMk7/3LQoNDo7yPybH7z2d+mr3yygGq+BvUmkkT4P1yoGwpYe+FKbO0lHFnEtV4frCM+qaTC
 n1fEkQBD36PfDrJtitoZTYFAZOMeMhk=
X-Proofpoint-ORIG-GUID: MuCc_GMCtTri4Ld0hzv61LIA3rpkaWqm
X-Proofpoint-GUID: MuCc_GMCtTri4Ld0hzv61LIA3rpkaWqm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200149

Hi All,

Here is a patch series fixing arm_scmi module autoloading this combines:

1. Patch 1/2 from Bjorn to add support for scmi bus modaliases to modpost:
https://lore.kernel.org/all/20260618-scmi-modalias-v2-1-8c7547c1be21@oss.qualcomm.com/

2. RFC 2/2 from Cristian which pre-populates the scmi { protocol, name }
tupple list with standard protocol info to break the circular dep:
https://patch.msgid.link/20250203100154.140877-2-cristian.marussi@arm.com

1. is not enough by itself because driver module auto-loading requires
the devices to already be created for udev to get the necessary uevents
based on which udev auto-loads modules.

But SCMI devices are only created after their { protocol, name } tupples
have been registered which is done from scmi_driver_register(), creating
a circular dependency.

2. breaks the circular dependency by pre-populating the { protocol, name }
list with the standard protocols. This allows the devices to be created
before the module with the driver is loaded, after which module auto
loading works the same as it does on any other bus.

I've tested this on a T14s Snapdragon laptop with Fedora's kernel config
where scmi_cpufreq is a module. With this series scmi_cpufreq correctly
autoloads even if it is not included in the initramfs.

I've added a 3th patch extending the pre-populating to also include all
the { protocol, name } tupples for the in tree SCMI drivers for IMX
vendor protocols, so that module auto-loading will work for all in tree
drivers.

Out of tree drivers can still register new tupples as before but their
modules will need to be manually loaded (also as before).

Regards,

Hans


Bjorn Andersson (1):
  module: add SCMI device table alias support

Cristian Marussi (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for standard
    protocols

Hans de Goede (1):
  firmware: arm_scmi: Pre-register protocol, name tupples for IMX
    protocols

 MAINTAINERS                       |  1 +
 drivers/firmware/arm_scmi/bus.c   | 75 +++++++++++++++++++++++--------
 include/linux/device-id/scmi.h    | 19 ++++++++
 include/linux/mod_devicetable.h   |  1 +
 include/linux/scmi_protocol.h     |  6 +--
 scripts/mod/devicetable-offsets.c |  4 ++
 scripts/mod/file2alias.c          | 11 +++++
 7 files changed, 94 insertions(+), 23 deletions(-)
 create mode 100644 include/linux/device-id/scmi.h

-- 
2.55.0

